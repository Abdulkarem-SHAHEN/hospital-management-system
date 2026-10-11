using System;
using System.Security.Cryptography;

namespace HospitalManagementSystem
{
    /// <summary>
    /// Password hashing with PBKDF2 (HMAC-SHA256) and a random salt per password.
    /// A hash is stored as:  PBKDF2$iterations$salt$key   (salt and key in Base64).
    /// </summary>
    public static class PasswordHasher
    {
        private const string Prefix = "PBKDF2";
        private const int Iterations = 100000;
        private const int SaltSize = 16;   // bytes
        private const int KeySize = 32;    // bytes

        public static string Hash(string password)
        {
            byte[] salt = new byte[SaltSize];
            using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }
            byte[] key = DeriveKey(password, salt, Iterations, KeySize);
            return Prefix + "$" + Iterations + "$" + Convert.ToBase64String(salt) + "$" + Convert.ToBase64String(key);
        }

        public static bool Verify(string password, string storedHash)
        {
            if (password == null || string.IsNullOrEmpty(storedHash))
            {
                return false;
            }

            string[] parts = storedHash.Split('$');
            int iterations;
            if (parts.Length != 4 || parts[0] != Prefix || !int.TryParse(parts[1], out iterations) || iterations <= 0)
            {
                return false;
            }

            byte[] salt;
            byte[] expected;
            try
            {
                salt = Convert.FromBase64String(parts[2]);
                expected = Convert.FromBase64String(parts[3]);
            }
            catch (FormatException)
            {
                return false;
            }
            if (salt.Length < 8 || expected.Length == 0)
            {
                return false;
            }

            byte[] actual = DeriveKey(password, salt, iterations, expected.Length);
            return SameBytes(actual, expected);
        }

        private static byte[] DeriveKey(string password, byte[] salt, int iterations, int length)
        {
            using (Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations, HashAlgorithmName.SHA256))
            {
                return pbkdf2.GetBytes(length);
            }
        }

        // compares every byte, so the time taken does not reveal where the first difference is
        private static bool SameBytes(byte[] a, byte[] b)
        {
            if (a.Length != b.Length)
            {
                return false;
            }
            int difference = 0;
            for (int i = 0; i < a.Length; i++)
            {
                difference |= a[i] ^ b[i];
            }
            return difference == 0;
        }
    }
}

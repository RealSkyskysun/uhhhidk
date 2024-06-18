import os
password = input("Enter your password: ")
def encrypt(filename):
 with open(filename, 'r') as f:
 data = f.read()
 decoded_data = base64.b64encode(data)
 file_name = filename[:-3] + ".txt"
 os.rename(filename, file_name)
 return file_name, decoded_data
def decrypt(file_name):
 data, file_name = encrypt(file_name)
 return base64.b64decode(data).encode()
def unlock():
 print("Your files are now unlocked")

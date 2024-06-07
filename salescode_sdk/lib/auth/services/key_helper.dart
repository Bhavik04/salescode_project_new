import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/asymmetric/pkcs1.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
//import 'package:pointycastle/export.dart';

class Cryptom {
  /// String Public Key
  static String publickey =
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvEbxPHVMhvoI4JVU0twKmV6+D0glCpxrAiN7+sp88xUvhA+IIrirRCGiq+v5rpG3VMJv3N5+Nxm/2JZwwMlw04tdCOoLdsp4iLc+UNq0iTZ5P2W/U7QhsQNDsA+qzPtZC28AUm1mfkNYu+FEkec5vkRxHk4Co7gd5RjGGlzSLmQIDAQAB";

  static String encrypt(String plaintext, String publicKey) {
    /// After a lot of research on how to convert the public key [String] to [RSA PUBLIC KEY]
    /// We would have to use PEM Cert Type and the convert it from a PEM to an RSA PUBLIC KEY through basic_utils
    var pem =
        '-----BEGIN RSA PUBLIC KEY-----\n$publickey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromPem(pem);

    /// Initalizing Cipher
    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));

    /// Converting into a [Unit8List] from List<int>
    /// Then Encoding into Base64
    Uint8List output =
        cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
    var base64EncodedText = base64Encode(output);
    return base64EncodedText;
  }

  static String text(String text) {
    String encryptedPassword = "${DateTime.now().millisecondsSinceEpoch}:$text";
    return encrypt(encryptedPassword, publickey);
  }
}

import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {

  Future<String> getServerKeyToken() async {

    final scopes = [
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(

      ServiceAccountCredentials.fromJson({

        "type": "service_account",
        "project_id": "lost-and-found-634f2",

        "private_key_id": "9f9b3276958170165c2c0b94941a91f467e95aff",

        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCrPYFajROEs+QY\nLIEv5fL6tfX/7Y/4cIkmkl7pcujUx4kS4zgXPIXUvQcdUzzwynEThMKNCGrPAchu\n8ITJmpjSvl0BeRVr016Bp7RNEmy4hhLhxhzd/pIBUDeR/y+BYbFBhIDq7nhceEUM\nTOz+GLo1mNcAkGAr530GYP893PYtT7H57L9eBK+GeCAw2esNwiPmDdaQO/dIoshH\n8HYtYy6zndHs6J1GWXIMTX9N1nnLUAc0/ym4Y9L4SPnNWEME0CZn3zwJ0bSCCv+a\nCyySUY4eveQJc+R1lWt0T+wU42NXCgJYu6WekZiL8z8Tx4EIbTjl3EL9/khHcQSD\ntcni3L3XAgMBAAECggEAGukVBCEfMUprQj3y5WSajTooQ9qBDBbKBETvY8+E9d9k\n/ry04A3zrY2GlIi0Dyvj86B4Sd1J773aJ6O7snUNptzMqpfCkonf6bnsX0pRyfkj\n9tWBTC/JS9SKjx05Hs42otMLHCByy3wJGdhC9uGgQx5W93COSd1crAfKmjMN1ZZ/\nsxSzohv5wwgeQN/l8IcBwZFcWLSxm1wzoukbNUjW2GO10NrPzmgWoQidx0+DKDDJ\nucb0ykFxS1Ic6M8JSVLaUfvt9L9P0rlkcksXu0MPzrrEuUM+IPHhJuhKHoObp5ML\nOJ26UwAMnJarfrfLsSIaW5nbGhQuh8V+PzLjZejeSQKBgQDmVWsKmpnow07hiy4y\nW8zg94uYxngsVCkUEbJt0GpXobcV+RAUbvhC8Q4jvGZTfeSGI8r93SZhfDa6zxOV\nFrtKL1Ni/ga26qnCZFSBess4EsVFi7EKYm9/jAfQu/ER6GeQ6pNWMgh+t93iv62D\n5TJR8fjLyAHCC43/71YfIUbfeQKBgQC+Ul34QMxadGLNBUGhehx6T1E7GQ0wp00V\nK3C5bAm38J4DAcueHfp/TXFoEpwFnYmdmLhsEl2dT/Uoi7TiBSDQBTyLh/w948ZT\nZMczi2sqly+LacgWOgo1WL/9DWowHJ7AuwkOCaj2yBusDuLG2VISmoylRGmjEph6\nL9nkR2SjzwKBgA0u4GSH+r0myJICLE+3j19k67l/yosG+h7q8GJ2pk+Dsv3v9mqk\n+1Khh2SmONkYgIbo74peKP81Y9CHX6CN34RcdxJYZbv8bGDy6x9KDu2TrXTQjP6C\nKc2MDzp0N1UGDz9tHae2T2QpU+rRe7Xr3VhxWAMZ3Hflv2fho/U+K1dJAoGAZobm\nunrl24DBTOMdBQlMWBNsliKbuW8XFmVtd2YdIisMZGBOOaK6tGOayU7lIB1K6kxA\nZW/LYJiXYD1Kt0u97nIzuJMMLqcKyxgKO9lKZQpHAZp9wIOJxk1GN+NHJh3046ye\nZyKLFE6eoaTvQ+IE1aLOS6W8Jq441/H5NoHDVH8CgYAplrAGo7gwwfQvqytWcl3b\ns+cdDSz9Hff6UIfIBuzWEnFBtdXeBwipHkGY8NbyxsQ4DTNEwLVGtRvgq1rxOB00\nVtJyXp3pBYRn4hfW2P/1Y57kZKvnsVo7F3ZkkoImUHk3XdZEXUDOkXLMjoweQogF\nW/23Tj49l9lDDgOkJZCBdQ==\n-----END PRIVATE KEY-----\n",


        "client_email":
        "firebase-adminsdk-fbsvc@lost-and-found-634f2.iam.gserviceaccount.com",

        "client_id": "110984235917887284549",

        "auth_uri": "https://accounts.google.com/o/oauth2/auth",

        "token_uri": "https://oauth2.googleapis.com/token",

        "auth_provider_x509_cert_url":
        "https://www.googleapis.com/oauth2/v1/certs",

        "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40lost-and-found-634f2.iam.gserviceaccount.com",

      }),

      scopes,
    );

    return client.credentials.accessToken.data;
  }
}
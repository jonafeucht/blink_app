class LoginModel {
  LoginModel({
    this.account,
    this.auth,
    this.phone,
    this.verification,
    this.lockoutTimeRemaining,
    this.forcePasswordReset,
    this.allowPinResendSeconds,
  });

  Account? account;
  Auth? auth;
  Phone? phone;
  Verification? verification;
  int? lockoutTimeRemaining;
  bool? forcePasswordReset;
  int? allowPinResendSeconds;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        account: Account.fromJson(json["account"]),
        auth: Auth.fromJson(json["auth"]),
        phone: Phone.fromJson(json["phone"]),
        verification: Verification.fromJson(json["verification"]),
        lockoutTimeRemaining: json["lockout_time_remaining"],
        forcePasswordReset: json["force_password_reset"],
        allowPinResendSeconds: json["allow_pin_resend_seconds"],
      );

  Map<String, dynamic> toJson() => {
        "account": account!.toJson(),
        "auth": auth!.toJson(),
        "phone": phone!.toJson(),
        "verification": verification!.toJson(),
        "lockout_time_remaining": lockoutTimeRemaining,
        "force_password_reset": forcePasswordReset,
        "allow_pin_resend_seconds": allowPinResendSeconds,
      };
}

class Account {
  Account({
    this.accountId,
    this.userId,
    this.clientId,
    this.clientTrusted,
    this.newAccount,
    this.tier,
    this.region,
    this.accountVerificationRequired,
    this.phoneVerificationRequired,
    this.clientVerificationRequired,
    this.requireTrustClientDevice,
    this.countryRequired,
    this.verificationChannel,
    this.user,
    this.amazonAccountLinked,
  });

  int? accountId;
  int? userId;
  int? clientId;
  bool? clientTrusted;
  bool? newAccount;
  String? tier;
  String? region;
  bool? accountVerificationRequired;
  bool? phoneVerificationRequired;
  bool? clientVerificationRequired;
  bool? requireTrustClientDevice;
  bool? countryRequired;
  String? verificationChannel;
  User? user;
  bool? amazonAccountLinked;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountId: json["account_id"],
        userId: json["user_id"],
        clientId: json["client_id"],
        clientTrusted: json["client_trusted"],
        newAccount: json["new_account"],
        tier: json["tier"],
        region: json["region"],
        accountVerificationRequired: json["account_verification_required"],
        phoneVerificationRequired: json["phone_verification_required"],
        clientVerificationRequired: json["client_verification_required"],
        requireTrustClientDevice: json["require_trust_client_device"],
        countryRequired: json["country_required"],
        verificationChannel: json["verification_channel"],
        user: User.fromJson(json["user"]),
        amazonAccountLinked: json["amazon_account_linked"],
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "user_id": userId,
        "client_id": clientId,
        "client_trusted": clientTrusted,
        "new_account": newAccount,
        "tier": tier,
        "region": region,
        "account_verification_required": accountVerificationRequired,
        "phone_verification_required": phoneVerificationRequired,
        "client_verification_required": clientVerificationRequired,
        "require_trust_client_device": requireTrustClientDevice,
        "country_required": countryRequired,
        "verification_channel": verificationChannel,
        "user": user!.toJson(),
        "amazon_account_linked": amazonAccountLinked,
      };
}

class User {
  User({
    this.userId,
    this.country,
  });

  int? userId;
  String? country;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "country": country,
      };
}

class Auth {
  Auth({
    this.token,
  });

  String? token;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class Phone {
  Phone({
    this.number,
    this.last4Digits,
    this.countryCallingCode,
    this.valid,
  });

  String? number;
  String? last4Digits;
  String? countryCallingCode;
  bool? valid;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        number: json["number"],
        last4Digits: json["last_4_digits"],
        countryCallingCode: json["country_calling_code"],
        valid: json["valid"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "last_4_digits": last4Digits,
        "country_calling_code": countryCallingCode,
        "valid": valid,
      };
}

class Verification {
  Verification({
    this.email,
    this.phone,
  });

  Email? email;
  VerificationPhone? phone;

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        email: Email.fromJson(json["email"]),
        phone: VerificationPhone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email!.toJson(),
        "phone": phone!.toJson(),
      };
}

class Email {
  Email({
    this.req,
  });

  bool? req;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        req: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "required": req,
      };
}

class VerificationPhone {
  VerificationPhone({
    this.req,
    this.channel,
  });

  bool? req;
  String? channel;

  factory VerificationPhone.fromJson(Map<String, dynamic> json) =>
      VerificationPhone(
        req: json["required"],
        channel: json["channel"],
      );

  Map<String, dynamic> toJson() => {
        "required": req,
        "channel": channel,
      };
}

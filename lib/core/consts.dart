String prodUrl = "https://rest-prod.immedia-semi.com/api/v5/account/login";

getVerifyUrl(tier, accountID, clientID) {
  return "https://rest-$tier.immedia-semi.com/api/v4/account/$accountID/client/$clientID/pin/verify";
}

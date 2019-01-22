pragma solidity ^0.5.0;



contract Website {
 
 uint storedData;


//Website - logs visitors, user clicks, and form submits; tracks who is the owner; receives public key and encrypted private key of encryption wallet

struct Account 
	{
	string loginURL;
	string username;
	string hash;
	}

mapping (domain => Account) loginCredentials;
string[] public accounts;

string domain;
address owner;
string accounts
address encryptorPublickey;
string encryptorPrivateKey;


constructor(address publicKey, string encryptedPrivateKey) public
{
encryptorPublickey = publicKey;
encryptorPrivateKey = encryptedPrivateKey;
owner = msg.sender;
}
  
function set(uint x) public {
  
  storedData = x;

  }



 function get() public view returns (uint) {

 return storedData;

  }


}

pragma solidity ^0.5.0;



contract Website {

 uint storedData;


//Website - logs visitors, user clicks, and form submits; tracks who is the owner; receives public key and encrypted private key of encryption wallet


string domain;
address owner;
string state;
address encryptorPublickey;
string encryptorPrivateKey;
string captchaImageURL;

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

event analytics (
	string address,
	string eventType,
	string elementID
);

function logAction(string _address, string _eventType, string _elementID) public
	{
	analytics(_address, _eventType, _elementID);
	}

function websiteStats()
  {

  }

}

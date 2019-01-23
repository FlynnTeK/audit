pragma solidity ^0.5.0;



contract Website {

 uint storedData;


//Website - logs visitors, user clicks, and form submits; tracks who is the owner; receives public key and encrypted private key of encryption wallet


string domain;
address owner;
string state;
address encryptorPublickey;
string encryptorePrivateKey;
address encryptorUnencryptedPrivateKey;
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

function logAction(string _eventType, string _elementID) public
	{
	analytics(msg.sender, _eventType, _elementID);
	}

function captchaAnswer(string _answer, string _newImageURL, string _newAnswerHash) public
  {
  analytics(msg.sender, "captchaAnswer", _answer);
  captchaImageURL = _newImageURL;
  analytics(msg.sender, "captchaNew", _newAnswerHash);
  }

function getDomain() public
  {
    return domain;
  }

  function getOwner() public
    {
    return owner;
    }

//Auction - tracks highest bidder; transfers contract ownership; pays all parties involved their percentages
uint highestBid;
address highestBidder;

function placeBid () Payable
  {
    require(
            msg.value > highestBid,
            "There already is a higher bid."
        );
    highestBid = msg.amount;
    highestBidder = msg.sender;
  }
}

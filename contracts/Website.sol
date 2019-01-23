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

  function getCaptchaImage() public
    {
    return captchaImageURL;
    }

  function getState() public
    {
    return state;
    }
//Auction - tracks highest bidder; transfers contract ownership; pays all parties involved their percentages
uint auctionEnd;

function startAuction(uint biddingTime) public
  {
  require(msg.sender === owner);
  auctionEnd = now + biddingTime;
  state = "auction";
  }

uint highestBid;
address highestBidder;
mapping(address => uint) pendingReturns;


function placeBid () public Payable
  {
    require(
        state === "auction",
        "Not currently selling website"
      );

    require(
               now <= auctionEnd,
               "Auction already ended."
           );

           require(
               msg.value > highestBid,
               "There already is a higher bid."
           );

           if (highestBid != 0) {
               pendingReturns[highestBidder] += highestBid;
           }
           highestBidder = msg.sender;
           highestBid = msg.value;
}


function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            // It is important to set this to zero because the recipient
            // can call this function again as part of the receiving call
            // before `send` returns.
            pendingReturns[msg.sender] = 0;

            if (!msg.sender.send(amount)) {
                // No need to call throw here, just reset the amount owing
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    /// End the auction and send the highest bid
    /// to the beneficiary.

event AuctionEnded (
  address highestBidder,
  uint highestBid
  );

    address previousOwner
    function auctionEnd() public {
        // It is a good guideline to structure functions that interact
        // with other contracts (i.e. they call functions or send Ether)
        // into three phases:
        // 1. checking conditions
        // 2. performing actions (potentially changing conditions)
        // 3. interacting with other contracts
        // If these phases are mixed up, the other contract could call
        // back into the current contract and modify the state or cause
        // effects (ether payout) to be performed multiple times.
        // If functions called internally include interaction with external
        // contracts, they also have to be considered interaction with
        // external contracts.

        // 1. Conditions
        require(now >= auctionEnd, "Auction not yet ended.");
        require(state !== "sold", "auctionEnd has already been called.");

        // 2. Effects
        state = "sold";
        previousOwner = owner;
        owner = highestBidder;
        emit AuctionEnded(highestBidder, highestBid);

        // 3. Interaction
        beneficiary.transfer(highestBid);
    }
}

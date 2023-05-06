// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract DAO {
struct Proposal{
uint id;
string description;
uint amount;
address payable receipient;
uint votes;
uint end;
bool isExecuted;
}

mapping(address=>bool) private isInvestor;
mapping(address=>uint) public numOfshares;
mapping(address=>mapping(uint=>bool)) public isVoted;
address[] public investorsList;
mapping(uint=>Proposal) public proposals;
uint public totalShares;
uint public availableFunds;
uint public participationTimeEnd;
uint public nextProposalId;
uint public voteTime;
uint public quorum;
address public manager;

constructor (uint _participationTimeEnd , uint _voteTime , uint _quorum){
     participationTimeEnd = block.timestamp+ _participationTimeEnd; 
     voteTime = _voteTime;
     quorum = _quorum;
     manager=msg.sender;
 }
    modifier onlyInvestor(){
      require(isInvestor[msg.sender]==true,"You are not an investor");
      _;
}
    modifier onlyManager(){
     require(manager==msg.sender,"You are not a manager");
      _;
}
    function contribution() public payable{
    require(participationTimeEnd>=block.timestamp,"Contribution Time Ended");//5 PM , //16342343342 + 2*3600 > 16342340000
    require(msg.value>0,"Send more than 0 ether");
    isInvestor[msg.sender]=true;
    numOfshares[msg.sender]=numOfshares[msg.sender]+msg.value;
    totalShares+=msg.value; //totaltShares=totalShares+msg.value
    availableFunds+=msg.value;
    investorsList.push(msg.sender);
}

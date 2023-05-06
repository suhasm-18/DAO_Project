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

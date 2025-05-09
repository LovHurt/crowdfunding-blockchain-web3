// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CrowdFunding {

    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 goal;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }

    mapping(uint256 => Campaign) public campaigns;

    uint256 public campaignCount = 0;

    function createCompaign(address _owner, string memory _title, string memory _description, uint256 _goal, uint256 _deadline, string memory _image) public returns (uint256) {
        Campaign storage campaign = campaigns[campaignCount];

        require(campaign.deadline < block.timestamp, "Deadline must be in the future");

        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.goal = _goal;
        campaign.deadline = _deadline;
        campaign.amountCollected = 0;
        campaign.image = _image;

        campaignCount++;

        return campaignCount - 1;
    }

    function donateToCampaign(uint256 _id) public payable  {
        uint256 amount = msg.value;
        Campaign storage campaign = campaigns[_id];

        campaign.donators.push(msg.sender);
        campaign.donations.push(amount);

        (bool sent,) = payable(campaign.owner).call{value: amount}("");

        if(sent){
            campaign.amountCollected = campaign.amountCollected + amount;
        }
        
    }

    function getDonators(uint256 _id) public view returns (address[] memory, uint256[] memory) {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }

    function getCampaigns() public view returns (Campaign[] memory){
        Campaign[] memory _campaigns = new Campaign[](campaignCount);

        for(uint i=0; i < campaignCount; i++){
            Campaign storage item = campaigns[i];

            _campaigns[i] = item;
        }

        return _campaigns;
    }
}
pragma solidity ^0.5.0;

contract Test{

    bytes32[] skills;
    uint256[] skill_levels;
    
    struct Developer {
        address owner;
        string name;
        bytes32 namehash;
        bytes32[] skills;
        uint256[] skill_levels;
        uint wallet;
    }

    mapping (bytes32=>Developer) public developers;
    
    constructor() public {
        skills.push('xx');
        skills.push('yy');
        
        skill_levels.push(11);
        skill_levels.push(22);
        
        developers[keccak256(abi.encodePacked('ifti'))] = Developer({
            owner: 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c,
            name: 'ifti',
            namehash: keccak256(abi.encodePacked('ifti')),
            wallet: 100,
            skills: skills,
            skill_levels: skill_levels
        });
    }
    
    function getStats(string memory _name) public view returns(address,string memory,bytes32[] memory,uint256[] memory,bytes32){
        bytes32 h = keccak256(abi.encodePacked(_name));
        require(developers[h].namehash == h, "A Developer with that name does not exist");
        return (developers[h].owner, developers[h].name, developers[h].skills, developers[h].skill_levels, developers[h].namehash);
    }
}
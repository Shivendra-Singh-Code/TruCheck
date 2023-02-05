// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.0 <0.9.0;
contract prodinfo{
    address public owner;
    constructor() public {
        owner=msg.sender;

    }
    modifier onlyOwner{
        require(msg.sender==owner);
        _;
    }
    struct prod{
        uint blockno; 
         //string proid;
        string prodname;
        string currentState;
        uint time_stamp;
        string souadd; //source address
        string desadd; //dersination address
        address roleAddress;
        string role;
    }

   // co
    mapping( string => prod) public prodata;
    /*function create_prod(//uint _blockno, 
                        string memory _proid,
                        string memory _prodname,
                        string memory _currentState,
                        //uint _timestamp,
                        string memory _souadd,
                        string memory _desadd,
                        address _roleAddress,
                        string memory _role)public onlyOwner{
                                            uint blockno=0;
                                            //blockno=string(_blockno++);
                                            blockno++;
                                            uint timestamp;
                                            timestamp=now;
                                            prodata[_proid]=prod(blockno,
                                                                _prodname,
                                                                _currentState,
                                                                timestamp,
                                                                _souadd,
                                                                _desadd,
                                                                _roleAddress,
                                                                _role);
                                           
                                           //prodata[_proid]._prodname=_prodmane;

                                        }*/
    
    
    function create_prod(//uint _blockno, 
                        string memory _proid,
                        string memory _prodname,
                        string memory _currentState,
                        //uint _timestamp,
                        string memory _souadd,
                        string memory _desadd,
                        address _roleAddress,
                        string memory _role)public onlyOwner{
                                            uint blockno=1;
                                            //blockno=string(_blockno++);
                                            prod memory _prod;
                                            blockno++;
                                            //uint _timestamp;
                                            //_timestamp=block.timestamp;
                                            _prod.blockno=blockno;
                                            //_prod.proid=_proid;
                                            _prod.prodname=_prodname;
                                            _prod.currentState=_currentState;
                                            _prod.time_stamp=block.timestamp;
                                            _prod.souadd=_souadd;
                                            _prod.desadd=_desadd;
                                            _prod.roleAddress=_roleAddress;
                                            _prod.role=_role;
                                            prodata[_proid]=_prod;
                                           
                                           

                                        }
    
    function get_data(string memory proid) public view returns (uint) {
        return( prodata[proid].blockno);
    }                                    

    function update_data((//uint _blockno, 
                        string memory _proid,
                        string memory _prodname,
                        string memory _currentState,
                        //uint _timestamp,
                        string memory _souadd,
                        string memory _desadd,
                        address _roleAddress,
                        string memory _role)public onlyOwner{
                        uint blockup;
                        blockup=prodata[proid].blockno;
                        blockup++;




}

/// Working in Progress

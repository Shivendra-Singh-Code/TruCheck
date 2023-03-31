// SPDX-License-Identifier: GPL-3.0



pragma solidity >=0.4.0 <0.9.0;

contract prodinfo{
    
    struct States{
        //uint blockno; 

        string currentState;

        uint time_stamp;

        string souadd; //source address

        string desadd; //dersination address

        address roleAddress;

        string role;
    }

    struct prod{

        uint256 proid;

        string proname;

        uint256 totalStates;

        mapping(uint256=> States) positions; 

       

    }

    mapping( uint256 => prod) public prodata;
    uint256 item=0;

    function create_prod(
                            uint256  _proid,

                            string memory _proname

                        ) public returns ( bool) {
                                //uint blockno=1;
                                prod memory _prod=prod({proid: _proid, proname: _proname, totalStates: 0});
                                
                                prodata[_proid]=_prod;
                                return true;

                                                              
                        }
    function updatestate(   
                        uint _proid,

                        string memory _currentState,

                        //uint _timestamp,

                        string memory _souadd,

                        string memory _desadd,

                        //address _roleAddress,

                        string memory _role ) public returns (string memory){

                            

                            States memory newState = States({ currentState: _currentState,
                                                            time_stamp: block.timestamp ,
                                                            souadd: _souadd, 
                                                            desadd: _desadd,
                                                            roleAddress: msg.sender,
                                                            role: _role   });
                            
                            prodata[_proid].positions[ prodata[_proid].totalStates ]=newState;
        
                            prodata[_proid].totalStates = prodata[_proid].totalStates +1;
        
                        }


}



//Working in progress

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

                            string memory _proname,

                            string memory _currentState,

                            //uint _timestamp,

                            string memory _souadd,

                            string memory _desadd,

                            //address _roleAddress,

                            string memory _role

                        ) public returns ( bool) {
                                //uint blockno=1;
                                prodata[_proid]=prod({proid: _proid, proname: _proname, totalStates: 0});
                                
                                prod storage _prod= prodata[_proid];
 
                                States memory newState = States({ currentState: _currentState,
                                                            time_stamp: block.timestamp ,
                                                            souadd: _souadd, 
                                                            desadd: _desadd,
                                                            roleAddress: msg.sender,
                                                            role: _role   });
                            
                            prodata[_proid].positions[ prodata[_proid].totalStates ]=newState;
        
                            prodata[_proid].totalStates = prodata[_proid].totalStates +1;

                                return true;

                                                              
                        }



    function updatestate(   
                        uint _proid,

                        string memory _currentState,

                        //uint _timestamp,

                        //string memory _souadd,

                        string memory _desadd,

                        //address _roleAddress,

                        string memory _role ) public returns (string memory){

                            prod storage p=prodata[_proid];
                            
                            uint count = p.totalStates -1;
                            
                            string memory _souadd=p.positions[count].desadd;

                            States memory newState = States({ currentState: _currentState,
                                                            time_stamp: block.timestamp ,
                                                            souadd: _souadd, 
                                                            desadd: _desadd,
                                                            roleAddress: msg.sender,
                                                            role: _role   });
                            
                            prodata[_proid].positions[ prodata[_proid].totalStates ]=newState;
        
                            prodata[_proid].totalStates = prodata[_proid].totalStates +1;
        
                        }
    
    function get_prodata( uint _proid) public returns ( uint , string memory, uint ){

        prod storage p=prodata[_proid];
         return (p.proid, p.proname, p.totalStates);
        
        //return( p.proid, p.proname);
        /*for (uint256 j=0; j<=p.totalStates; j++){
            return(
                p.positions[j].currentState,
                p.positions[j].role
            );
        }*/
        

    }

    function get_prostates(uint _proid, 
                           uint j ) public returns (string memory, 
                                                        uint ,
                                                        string memory, 
                                                        string memory,
                                                        address, 
                                                        string memory){
                                                            prod storage p=prodata[_proid];
                                                            return(p.positions[j].currentState,
                                                                   p.positions[j].time_stamp,
                                                                   p.positions[j].souadd,
                                                                   p.positions[j].desadd,
                                                                   p.positions[j].roleAddress,
                                                                   p.positions[j].role);
                                                        }

}

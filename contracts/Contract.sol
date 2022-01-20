// SPDX-License-Identifier: GPL-3.0

pragma solidity>= 0.8.0;
contract Contract {

    struct customerDocs{
        string panCard;
        string aadharCard;
        string photograph;
        string signature;
    }

    struct customerDetails{
        string firstName;
        string lastName;
        string DOB;
        string emailAddress;
        string homeAddress;
        string pancNumber;
        string aadharcNumber;
    }

    struct Customer{
        customerDetails customer_details;
        customerDocs customer_docs;
    }

    mapping(address => Customer) private customer;

    function setCustomer(string memory _firstName,string memory _lastName,string memory _DOB,string memory _emailAddress,string memory _homeAddress,string memory _pancNumber,string memory _aadharcNumber, string memory _panCard,string memory _aadharCard,string memory _photograph,string memory _signature) public {  
        customer[msg.sender].customer_details = customerDetails(_firstName, _lastName, _DOB, _emailAddress, _homeAddress, _pancNumber, _aadharcNumber);
        customer[msg.sender].customer_docs = customerDocs(_panCard, _aadharCard, _photograph, _signature);
    }

    function getCustomer(address index) public view returns (Customer memory) {
        return customer[index];
    }

    function getCustomerDetails(address index) public view returns (customerDetails memory) {
        return customer[index].customer_details;
    }

    function getCustomerDocs(address index) public view returns (customerDocs memory){
        return customer[index].customer_docs;
    }

}
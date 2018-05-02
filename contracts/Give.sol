pragma solidity ^0.4.18;

import "./Mortal.sol";
import "./CircuitBreaker.sol";

// Give
contract Give is Mortal, CircuitBreaker {

    // 記事
    struct Article {
        address addr;
        string message;
    }

    mapping (address => Article) public articles; // メッセージ
    mapping (address => uint) public giveBalance; // 感謝資金

    // コンストラクタ
    function Give() public {
    }

    // 記事の投稿
    function postArticle(address _target, string _message) public isStopped {

        // 記事の保存
        Article storage article = articles[msg.sender];
        article.addr = _target;
        article.message = _message;
    }

    // 記事の投稿
    function getArticle() public isStopped {

        // 記事の保存
        Article storage article = articles[msg.sender];
        article.addr = _target;
        article.message = _message;
    }

    
}
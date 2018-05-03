pragma solidity ^0.4.18;

import "./Mortal.sol";
import "./CircuitBreaker.sol";

// 知識コントラクト
contract ThothContract is Mortal, CircuitBreaker {

    // 知識
    struct Knowledge {
        address addr;
        string title;
        string content;
        uint256 numReferred;
        mapping (uint256 => address) referredUsers;
    }

    uint256[] internal allKnowledges;
    uint256 internal numKnowledges;  // 知識数
    mapping (uint256 => Knowledge) internal knowledges; // 知識マップ
    mapping (address => uint256[]) internal ownedKnowledges; // 投稿者別知識
    mapping (address => uint) internal ownedBalance; // 投稿者別資金

    // コンストラクタ
    function ThothContract() public {
        numKnowledges = 0;
    }

    // 知識の投稿
    function postKnowledge(string _title, string _content) public isStopped {

        // 知識の保存
        uint256 knowledgeInt = numKnowledges++;
        Knowledge storage knowledge = knowledges[knowledgeInt];
        knowledge.addr = msg.sender;
        knowledge.title = _title;
        knowledge.content = _content;
        knowledge.numReferred = 0;

        ownedKnowledges[msg.sender].push(knowledgeInt);
        allKnowledges.push(knowledgeInt);
    }

    function getKnowledge(uint256 _knowledgeInt) external view returns (string title, string content, uint256 numReferred) {
        Knowledge memory knowledge = knowledges[_knowledgeInt];

        title = knowledge.title;
        content = knowledge.content;
        numReferred = knowledge.numReferred;
    }

    function getOwnedKnowledges() public view returns (uint256[]) {
        return ownedKnowledges[msg.sender];
    }

    function getAllKnowledges() public view returns (uint256[]) {
        return allKnowledges;
    }

    // 役立った
    function referred(uint256 _knowledgeInt) external payable isStopped {

        // 知識を取得
        Knowledge storage knowledge = knowledges[_knowledgeInt];

        // 既に役立った済みの場合は処理終了
        for(uint256 i = 0; i <= knowledge.numReferred; i++){
            require(knowledge.referredUsers[i] != msg.sender);
        }
        knowledge.numReferred++;
        knowledge.referredUsers[knowledge.numReferred] = msg.sender;

        // 知識の投稿者資金へ追加
        ownedBalance[knowledge.addr] += msg.value;
    }

    // 引き出し処理
    function withdraw() external {
        // 残金が0より大きい場合に処理
        require(ownedBalance[msg.sender] > 0);

        // 残金の退避
        uint256 refundAmount = ownedBalance[msg.sender];

        // 残金の更新
        ownedBalance[msg.sender] = 0;

        // 送金
        msg.sender.transfer(refundAmount);
    }
}
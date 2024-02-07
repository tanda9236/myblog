package com.tanda.myblog.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tanda.myblog.dto.ReplySaveRequestDto;
import com.tanda.myblog.model.Board;
import com.tanda.myblog.model.LikeBoard;
import com.tanda.myblog.model.User;
import com.tanda.myblog.repository.BoardRepository;
import com.tanda.myblog.repository.LikeBoardRepository;
import com.tanda.myblog.repository.ReplyRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardRepository boardRepository;
	private final ReplyRepository replyRepository;
	private final LikeBoardRepository likeBoardRepository;
	
	@Transactional
	public void 글쓰기(Board board, User user) {
		board.setCount(0);
		board.setUser(user);
		String content = board.getContent();
		String thumbnail = extractThumbnail(content);
		board.setThumbnail(thumbnail);
		boardRepository.save(board);
	}// 게시글 작성
	
	private String extractThumbnail(String content) {
        Document doc = Jsoup.parse(content);
        Elements imgTags = doc.select("img");
        if (!imgTags.isEmpty()) {
            Element firstImgTag = imgTags.first();
            String src = firstImgTag.attr("src");
            return src.startsWith("http") ? src : null;
        } else {
            return null;
        }
    }// 썸네일 추출 메서드
	
	
	
	@Transactional(readOnly = true)
	public Page<Board> 글목록(Pageable pageable){
		return boardRepository.findAll(pageable);
	}// 전체 게시글 목록
	
	@Transactional(readOnly = true)
	public Page<Board> 유저별글목록(int id, Pageable pageable) {
	    return boardRepository.findByUserId(id, pageable);
	}// 유저별 글 목록
	
	@Transactional(readOnly = true)
	public Board 글상세보기(int userId, int id) {
		return boardRepository.findByUserIdAndId(userId, id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}// 게시글 상세보기
	
	@Transactional(readOnly = true)
	public Board 글상세보기(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}// 게시글 상세보기(수정페이지)
	
	@Transactional
	public void 글수정(int id, Board requestBoard) {
		Board board = boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
				});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
		String content = board.getContent();
		String thumbnail = extractThumbnail(content);
		board.setThumbnail(thumbnail);
	}// 게시글 수정
	
	@Transactional
	public void 글삭제(int id) {
		System.out.println("글삭제:"+id);
		boardRepository.deleteById(id);
	}// 게시글 삭제
	
	@Transactional
	public void 댓글쓰기(ReplySaveRequestDto replySaveRequestDto) {
		int result = replyRepository.replySave(replySaveRequestDto.getUserId(),replySaveRequestDto.getBoardId(),replySaveRequestDto.getContent());
		System.out.println("BoardService : "+result);
	}// 댓글 작성
	
	@Transactional
	public void 댓글삭제(int replyId) {
		replyRepository.deleteById(replyId);
	}// 댓글 삭제
	
	@Transactional
    public void 조회수(int id) {
        Board board = boardRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다."));
        board.setCount(board.getCount() + 1);
        boardRepository.save(board);
    }// 조회수 증가

	@Transactional
	public void 좋아요추가(User user, int boardId, LikeBoard requestLikeBoard) {
		Board board = boardRepository.findById(boardId).orElseThrow(()->{
			return new IllegalArgumentException("실패 : 게시글 아이디를 찾을 수 없습니다.");
		});
		requestLikeBoard.setUser(user);
		requestLikeBoard.setBoard(board);
		
		likeBoardRepository.save(requestLikeBoard);
	}// 좋아요 추가
	
	@Transactional
    public void 좋아요취소(int boardId, int userId) {
        likeBoardRepository.unlike(boardId, userId);
    }// 좋아요 취소
	
	@Transactional(readOnly = true)
	public int 좋아요유무(int boardId, int userId){
		return likeBoardRepository.findByBoardId(boardId, userId);
	}// 좋아요 유무 확인
}

package com.tanda.myblog.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Board {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false,length = 100)
	private String title;
	
	@Lob
	private String content;
	
	private int count;
	
	@ManyToOne(fetch = FetchType.EAGER) 
	@JoinColumn(name="userId")
	private User user;

	@OneToMany(mappedBy = "board",fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"board"}) // 댓글 무한 반복 방지
	@OrderBy("id desc")
	private List<Reply> replies;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@Transient // 댓글개수 DB매핑 방지
    private int replyCount;

    public int getReplyCount() {
        return replies != null ? replies.size() : 0;
    }
    
    private String thumbnail;
}

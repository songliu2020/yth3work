package cn.edu.nenu.domain;

import cn.edu.nenu.config.Constants;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Accessors(chain = true)
@Entity
@Table(name = "T_DICTIONARY")
public class Dictionarya {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length = 36,nullable = false)
    private String type; //文章类别
    @Column(length = 64,nullable = false)
    private String name; //文章标题
    @Column(length = 64,nullable = false)
    private String code;//属性值
    private float sort=0;//属性排序
    @Column(nullable = false)
    private Constants.Status status;//属性状态
}

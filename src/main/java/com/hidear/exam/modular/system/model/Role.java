package com.hidear.exam.modular.system.model;

import javax.persistence.*;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author stylefeng
 * @since 2017-06-20
 */
@Entity
@Table(name="tm_role")
public class Role {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @Id
	@GeneratedValue
	@Column(name = "id",nullable = false,length = 11)
	private Integer id;
    /**
     * 序号
     */
	@Column(name = "num",nullable = false,length = 11)
	private Integer num;
    /**
     * 父角色id
     */
	@Column(name = "pid",nullable = false,length = 11)
	private Integer pid;
    /**
     * 角色名称
     */
	@Column(name = "name",nullable = false,length = 255)
	private String name;
    /**
     * 提示
     */
	@Column(name = "tips",nullable = false,length = 11)
	private String tips;
    /**
     * 保留字段(暂时没用）
     */
	@Column(name = "version",nullable = false,length = 11)
	private Integer version;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

}

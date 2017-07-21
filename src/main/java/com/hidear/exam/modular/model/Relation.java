package com.hidear.exam.modular.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * <p>
 * 角色和菜单关联表
 * </p>
 *
 * @author stylefeng
 * @since 2017-06-20
 */
@Entity
@Table(name="tm_menu_role_relation")
public class Relation {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@Id
	@GeneratedValue
	@Column(name="id",nullable = false,length = 11)
	private Integer id;
    /**
     * 菜单id
     */
	@Column(name="menuid",nullable = false,length = 11)
	private Integer menuid;
    /**
     * 角色id
     */
	@Column(name="roleid",nullable = false,length = 11)
	private Integer roleid;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMenuid() {
		return menuid;
	}

	public void setMenuid(Integer menuid) {
		this.menuid = menuid;
	}

	public Integer getRoleid() {
		return roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

}

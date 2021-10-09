

#### 一、selectKey标签

**错误原因**  
不能以selectKey获取自增主键主键，现有的方法存在以下问题，并且不能实现mysql和pg兼容。

1、 使用LAST_INSERT_ID函数，这是mysql函数，pg中无引函数

```
SELECT LAST_INSERT_ID()
```
2、 使用pg中的序列但mysql无序列，且order不应该用AFTER

```
<selectKey resultType="java.lang.Integer" keyProperty="id" order="AFTER">
      select nextval('collection_assignments_id_seq')
    </selectKey>
```


**示例代码**

使用insert标签中的useGeneratedKeys和keyProperty代替

* useGeneratedKeys：（仅对 insert 和 update 有用）这会令 MyBatis 使用 JDBC 的 getGeneratedKeys 方法来取出由数据库内部生成的主键（比如：像 MySQL 和 SQL Server 这样的关系数据库管理系统的自动递增字段），默认值：false。
* keyProperty	（仅对 insert 和 update 有用）唯一标记一个属性，MyBatis 会通过 getGeneratedKeys 的返回值或者通过 insert 语句的 selectKey 子元素设置它的键值，默认：unset。如果希望得到多个生成的列，也可以是逗号分隔的属性名称列表。

```
<insert id="insertUser" parameterType="com.welab.mybatis.User" useGeneratedKeys="true" keyProperty="id">
	INSERT INTO users(NAME, age)
	values (
	#{name,jdbcType=VARCHAR},
	#{age,jdbcType=VARCHAR}
	)
</insert>
```
#### 二、set标签

**错误原因**  
set标签带有if标签按条件更新各字段时，都要考虑if代码执行或不执行两种情况，if标签下sql语句块末尾统一加上逗号，避免有些条件满足时语法出现问题，去除逗号操作交给mybatis框架实现
  
**示例代码**  

```
<update id="updateUser" parameterType="com.welab.mybatis.User">
    update users
    <set>
        <if test="age != null and age != ''">
            age = #{age},
        </if>
        <if test="name != null and name != ''">
            name = #{name},
        </if>
    </set>
    where id = #{id};
</update>
```

#### 三、trim标签

**错误原因**  

update标签下面set语句块也可以trim动态标签生成，每个if块都要带下逗号
  
**示例代码** 

```
<update id="updateUserTrim" parameterType="com.welab.mybatis.User">
    update users
    <trim prefix="set" suffixOverrides=",">
        <if test="age != null and age != ''">
            age = #{age},
        </if>
        <if test="name != null and name != ''">
            name = #{name},
        </if>
    </trim>
    where id = #{id};
</update>
```

#### 四、with语句

**错误原因**  

with语句过于复杂需要重构
  
**示例代码** 

```

```

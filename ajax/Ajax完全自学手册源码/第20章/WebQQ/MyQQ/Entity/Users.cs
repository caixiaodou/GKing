using System;
using System.Collections.Generic;
using System.Text;
using myqq.DataOperate;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace myqq.Entity
{
    /// <summary>
    /// 用户信息数据操作类
    /// </summary>
     public  class UsersOperator
    {
         public const string TABLENAME = "Users";
         private UserItem item;
         private UserList list=new UserList();
         /// <summary>
         ///构造方法
         /// </summary>
         public UsersOperator()
         {
             this.item = new UserItem();
         }

         public UserItem User
         {
             get { return this.item; }
             set { this.item = value; }
         }

         private DataView view;

         public DataView View
         {
             get { return view; }
             set { view = value; }
         }


         private int _lastUserId;

         public int LastUserId
         {
             get { return _lastUserId; }
         }

         /// <summary>
         /// 根据用户名和密码进行登录
         /// </summary>
         /// <param name="userid"></param>
         /// <param name="userpwd"></param>
         /// <returns></returns>
         public UserItem Login(int userid, string userpwd)
         {
             //定义数据操作通用类的对象
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;
             SqlCommand com = new SqlCommand();
             //构建一个查询语句，用来查询该用户及对应密码是否存在
             com.CommandText = "select * from users where id=@uid and LoginPwd=@pwd";
             //定义两个SQL参数，并定义其类型
             SqlParameter uid = new SqlParameter("@uid", SqlDbType.Int);
             SqlParameter pwd = new SqlParameter("@pwd",SqlDbType.VarChar,50);
             //定义两个SQL参数的值    
             uid.Value = userid;
             pwd.Value = userpwd;

             com.Parameters.Add(uid);
             com.Parameters.Add(pwd);
             //根据查询结果进行不同操作
             if (dbo.Select(com).Tables[0].Rows.Count == 1)
             {
                  //将查询结果封装成一个用户对象，并返回
                 DataRow row = dbo.Select(com).Tables[0].Rows[0];
                 this.item.Id = Convert.ToInt32(row["Id"]);
                 this.item.LoginPwd = row["LoginPwd"].ToString();
                 this.item.NickName = row["NickName"].ToString();
                 this.item.FaceId = Convert.ToInt32(row["FaceId"].ToString().Length<=0 ? 0 : row["FaceId"]);
                 this.item.Sex = row["Sex"].ToString();
                 this.item.Age = Convert.ToInt32(row["Age"]);
                 this.item.Name = row["Name"].ToString();
                 this.item.StarId = Convert.ToInt32(row["StarId"]);
                 this.item.BloodTypeId = Convert.ToInt32(row["BloodTypeId"]);

                 return this.item;
             }
             else
             {  
                 //未找到对应用户，则返回空对象
                 return null;
             }
         }
         /// <summary>
         /// 注册一个用户
         /// </summary>
         /// <param name="item">用户实体对象</param>
         /// <returns>在数据库中更新的记录行数</returns>
         public int InsertUser(UserItem item)
         {
             //定义一个数据库操作通用对象
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;
             //构建一个数据插入的SQL语句
             SqlCommand com = new SqlCommand();
             com.CommandText = "insert into Users values(@LoginPwd,@nickName,@faceId,@sex,@age,@name,@starId,@bloodTypeId)";
             //构建SQL参数对象，将用户实体对象的值与参数绑定
             com.Parameters.Add(new SqlParameter("@LoginPwd", SqlDbType.VarChar,50)).Value = item.LoginPwd;
             com.Parameters.Add(new SqlParameter("@nickName", SqlDbType.VarChar, 50)).Value = item.NickName;
             com.Parameters.Add(new SqlParameter("@faceId", SqlDbType.Int)).Value = item.FaceId;
             com.Parameters.Add(new SqlParameter("@sex", SqlDbType.VarChar,50)).Value = item.Sex;
             com.Parameters.Add(new SqlParameter("@age", SqlDbType.Int)).Value = item.Age;
             com.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar,50)).Value=item.Name;
             com.Parameters.Add(new SqlParameter("@starId", SqlDbType.Int)).Value = item.StarId;
             com.Parameters.Add(new SqlParameter("@bloodTypeId", SqlDbType.Int)).Value = item.BloodTypeId;
             //执行数据库插入操作，返回受影响的记录行数
             //SqlDataReader objReader = dbo.ModifyAndFind(com);
             //if (objReader.Read())
             //{
             //    return (int)objReader[0];
             //}
             //return -1;
             int result = dbo.Insert(com);
             this._lastUserId = this.getUserId();
             
             return result;
         }

         /// <summary>
         /// 根据参数中的用户ID更新该用户实体在数据库中的信息
         /// </summary>
         /// <param name="item">用户实体对象</param>
         /// <returns>更新所影响的行数</returns>
         public int Update(UserItem item)
         {
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;
             //构建一个数据操作对象，准备执行更新语句
             SqlCommand com = new SqlCommand();
             com.CommandText = "update Users set Loginpwd=@LoginPwd,nickName=@nickName,faceId=@faceId,sex=@sex,age=@age,name=@name,starId=@starId,bloodTypeId=@bloodTypeId where Id=@id ";
             //给SQL操作语句中的参数确定类型，并依次赋值
             com.Parameters.Add(new SqlParameter("@LoginPwd", SqlDbType.VarChar, 50)).Value = item.LoginPwd;
             com.Parameters.Add(new SqlParameter("@nickName", SqlDbType.VarChar, 50)).Value = item.NickName;
             com.Parameters.Add(new SqlParameter("@faceId", SqlDbType.Int)).Value = item.FaceId;
             com.Parameters.Add(new SqlParameter("@sex", SqlDbType.VarChar, 50)).Value = item.Sex;
             com.Parameters.Add(new SqlParameter("@age", SqlDbType.Int)).Value = item.Age;
             com.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 50)).Value = item.Name;
             com.Parameters.Add(new SqlParameter("@starId", SqlDbType.Int)).Value = item.StarId;
             com.Parameters.Add(new SqlParameter("@bloodTypeId", SqlDbType.Int)).Value = item.BloodTypeId;
             com.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = item.Id;

             //执行数据更新操作，返回被影响的记录行数
             return dbo.UpDate(com);
         }

         /// <summary>
         /// 获得最后申请成功的QQ号码
         /// </summary>
         /// <returns>申请成功的QQ号码</returns>
         public int getUserId()
         {
             //定义数据库操作通用类对象
             DbOperate objOperate = new DbOperate();
             objOperate.TableName = "Users";
             //定义数据操作对象，并初始其将执行的SQL语句
             SqlCommand com = new SqlCommand();
             com.CommandText = "select max(Id) from Users";
             //执行SQL语句，将查询到的数据集保存
             DataSet objSet=objOperate.Select(com);
             Console.WriteLine("返回值是："+objSet.Tables["Users"].Rows[0][0]);
             //返回查询到的第一个表中的第一行的第一列的数据
             return (int)objSet.Tables["Users"].Rows[0][0];
         }

         /// <summary>
         /// 根据编号查找用户信息
         /// </summary>
         /// <param name="userid">用户编号</param>
         /// <returns>用户实体对象</returns>
         public UserItem LoadUser(int userid)
         {
             //定义数据库操作通用类
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;

             //定义数据操作对象
             SqlCommand com = new SqlCommand();

             //定义查询语句，并确定其参数的类型与值
             com.CommandText = "select * from users where id=@uid ";
             SqlParameter uid = new SqlParameter("@uid", SqlDbType.Int);
             uid.Value = userid;

             com.Parameters.Add(uid);

             DataTable table = dbo.Select(com).Tables[0];
             
             //根据编号进行查找
             if (table.Rows.Count == 1)
             {
                 this.view = table.DefaultView;
                 this.item = new UserItem();

                 //如果找到对应记录，则将其封装到用户实体对象中
                 DataRow row = table.Rows[0];
                 this.item.Id = Convert.ToInt32(row["Id"]);
                 this.item.LoginPwd = row["LoginPwd"].ToString();
                 this.item.NickName = row["NickName"].ToString();
                 this.item.FaceId = Convert.ToInt32(row["FaceId"].ToString().Length<=0 ? 0 : row["FaceId"]);
                 this.item.Sex = row["Sex"].ToString();
                 this.item.Age = Convert.ToInt32(row["Age"]);
                 this.item.Name = row["Name"].ToString();
                 this.item.StarId =Convert.ToInt32( row["StarId"]);
                 this.item.BloodTypeId = Convert.ToInt32(row["BloodTypeId"]);

                 //返回该用户实体对象
                 return this.item;
             }
             else
             {
                 //如果没找到对应用户，返回空对象
                 return null;
             }
         }

         /// <summary>
         /// 查找所有用户信息列表
         /// </summary>
         /// <returns>所有用户信息列表</returns>
         public UserList LoadFrendList()
         {
             //定义数据库操作通用类的一个对象
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;

             //定义数据操作对象，并初始化其将执行的SQL语句
             SqlCommand com = new SqlCommand();
             com.CommandText = "select * from Users";

             //执行SQL语句，获取其数据集中的数据表
             DataTable table = dbo.Select(com).Tables[0];
             this.view = table.DefaultView;
             //迭代，将数据表中的用户信息添加到用户列表（集合）中
             foreach (DataRow row in table.Rows)
             {
                 UserItem item = new UserItem();
                 item.Id=Convert.ToInt32(row["Id"]);
                 item.LoginPwd = (string)row["LoginPwd"];
                 item.NickName = (string)row["NickName"];
                 item.FaceId = Convert.ToInt32(row["FaceId"]);
                 item.Sex =Convert.ToString( row["Sex"]);
                 item.Age = Convert.ToInt32(row["Age"]);
                 item.Name = Convert.ToString(row["Name"]);
                 item.StarId = Convert.ToInt32(row["StarId"]);
                 item.BloodTypeId = Convert.ToInt32(row["BloodTypeId"]);
                 this.list.Add(item);
             }

             return this.list.Length >= 1 ? this.list : null;
         }


         /// <summary>
         /// 查找所有用户信息列表
         /// </summary>
         /// <returns>所有用户信息列表</returns>
         public UserList LoadFrendByCondition(string strSql)
         {
             //定义数据库操作通用类的一个对象
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;

             //定义数据操作对象，并初始化其将执行的SQL语句
             SqlCommand com = new SqlCommand();
             com.CommandText = strSql;

             //执行SQL语句，获取其数据集中的数据表
             DataTable table = dbo.Select(com).Tables[0];
             //迭代，将数据表中的用户信息添加到用户列表（集合）中
             foreach (DataRow row in table.Rows)
             {
                 UserItem item = new UserItem();
                 item.Id = Convert.ToInt32(row["Id"]);
                 //item.LoginPwd = (string)row["LoginPwd"];
                // item.FriendshipPolicyId = Convert.ToInt32(row["FriendshipPolicyId"]);
                 item.NickName = (string)row["NickName"];
                 //item.FaceId = Convert.ToInt32(row["FaceId"]);
                 item.Sex = Convert.ToString(row["Sex"]);
                 item.Age = Convert.ToInt32(row["Age"]);
                 //item.Name = Convert.ToString(row["Name"]);
                 //item.StarId = Convert.ToInt32(row["StarId"]);
                 //item.BloodTypeId = Convert.ToInt32(row["BloodTypeId"]);
                 this.list.Add(item);
             }

             return this.list.Length >= 1 ? this.list : null;
         }
    }

    /// <summary>
    /// 用户实体类
    /// </summary>
    public class UserItem
    {
        public UserItem()
        { 
        
        }

        private int _id;
        private string _pwd;
        private string _nickName;
        private int _faceId;
        private string _sex;
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }


        public string LoginPwd
        {
            get { return _pwd; }
            set { _pwd = value; }
        }

        public int Id
        {
            get { return this._id; }
            set { this._id = value; }
        }

        public string NickName
        {
            get { return _nickName; }
            set { _nickName = value; }
        }


        public int FaceId
        {
            get { return _faceId; }
            set { _faceId = value; }
        }
      

        public string Sex
        {
            get { return _sex; }
            set { _sex = value; }
        }
        private int _age;

        public int Age
        {
            get { return _age; }
            set { _age = value; }
        }
        private int _starId;

        public int StarId
        {
            get { return _starId; }
            set { _starId = value; }
        }
        private int _bloodTypeId;

        public int BloodTypeId
        {
            get { return _bloodTypeId; }
            set { _bloodTypeId = value; }
        }
    }


    /// <summary>
    /// 用户信息列表
    /// </summary>
    public class UserList : IEnumerable
    {
        //真正用来封装消息信息的集合
        //private ArrayList list;
        public ArrayList list;
        public UserList()
        {
            this.list = new ArrayList();
        }

        /// <summary>
        /// 往用户列表中增加一个用户对象
        /// </summary>
        /// <param name="item">用户实体对象</param>
        /// <returns>用户实体对象在用户列表中的下标</returns>
        public int Add(UserItem item)
        {
            return this.list.Add(item);
        }

        /// <summary>
        /// 从用户列表中移除一个用户实体对象
        /// </summary>
        /// <param name="item">用户实体对象</param>
        public void Remove(UserItem item)
        {
            this.list.Remove(item);
        }

        /// <summary>
        /// 用户实体列表中的消息实体的总数
        /// </summary>
        public int Length
        {
            get { return this.list.Count; }
        }

        /// <summary>
        /// 实现用户列表的简单迭代
        /// </summary>
        /// <returns>用户列表中的枚举</returns>
        public IEnumerator GetEnumerator()
        {
            return this.list.GetEnumerator();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <returns></returns>
        public UserItem this[int index]
        {
            get
            {
                return (UserItem)this.list[index];
            }
            set
            {
                this.list[index] = value;
            }
        }
    }

}

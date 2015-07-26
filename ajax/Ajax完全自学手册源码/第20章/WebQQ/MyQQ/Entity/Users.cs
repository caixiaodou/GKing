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
    /// �û���Ϣ���ݲ�����
    /// </summary>
     public  class UsersOperator
    {
         public const string TABLENAME = "Users";
         private UserItem item;
         private UserList list=new UserList();
         /// <summary>
         ///���췽��
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
         /// �����û�����������е�¼
         /// </summary>
         /// <param name="userid"></param>
         /// <param name="userpwd"></param>
         /// <returns></returns>
         public UserItem Login(int userid, string userpwd)
         {
             //�������ݲ���ͨ����Ķ���
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;
             SqlCommand com = new SqlCommand();
             //����һ����ѯ��䣬������ѯ���û�����Ӧ�����Ƿ����
             com.CommandText = "select * from users where id=@uid and LoginPwd=@pwd";
             //��������SQL������������������
             SqlParameter uid = new SqlParameter("@uid", SqlDbType.Int);
             SqlParameter pwd = new SqlParameter("@pwd",SqlDbType.VarChar,50);
             //��������SQL������ֵ    
             uid.Value = userid;
             pwd.Value = userpwd;

             com.Parameters.Add(uid);
             com.Parameters.Add(pwd);
             //���ݲ�ѯ������в�ͬ����
             if (dbo.Select(com).Tables[0].Rows.Count == 1)
             {
                  //����ѯ�����װ��һ���û����󣬲�����
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
                 //δ�ҵ���Ӧ�û����򷵻ؿն���
                 return null;
             }
         }
         /// <summary>
         /// ע��һ���û�
         /// </summary>
         /// <param name="item">�û�ʵ�����</param>
         /// <returns>�����ݿ��и��µļ�¼����</returns>
         public int InsertUser(UserItem item)
         {
             //����һ�����ݿ����ͨ�ö���
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;
             //����һ�����ݲ����SQL���
             SqlCommand com = new SqlCommand();
             com.CommandText = "insert into Users values(@LoginPwd,@nickName,@faceId,@sex,@age,@name,@starId,@bloodTypeId)";
             //����SQL�������󣬽��û�ʵ������ֵ�������
             com.Parameters.Add(new SqlParameter("@LoginPwd", SqlDbType.VarChar,50)).Value = item.LoginPwd;
             com.Parameters.Add(new SqlParameter("@nickName", SqlDbType.VarChar, 50)).Value = item.NickName;
             com.Parameters.Add(new SqlParameter("@faceId", SqlDbType.Int)).Value = item.FaceId;
             com.Parameters.Add(new SqlParameter("@sex", SqlDbType.VarChar,50)).Value = item.Sex;
             com.Parameters.Add(new SqlParameter("@age", SqlDbType.Int)).Value = item.Age;
             com.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar,50)).Value=item.Name;
             com.Parameters.Add(new SqlParameter("@starId", SqlDbType.Int)).Value = item.StarId;
             com.Parameters.Add(new SqlParameter("@bloodTypeId", SqlDbType.Int)).Value = item.BloodTypeId;
             //ִ�����ݿ���������������Ӱ��ļ�¼����
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
         /// ���ݲ����е��û�ID���¸��û�ʵ�������ݿ��е���Ϣ
         /// </summary>
         /// <param name="item">�û�ʵ�����</param>
         /// <returns>������Ӱ�������</returns>
         public int Update(UserItem item)
         {
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;
             //����һ�����ݲ�������׼��ִ�и������
             SqlCommand com = new SqlCommand();
             com.CommandText = "update Users set Loginpwd=@LoginPwd,nickName=@nickName,faceId=@faceId,sex=@sex,age=@age,name=@name,starId=@starId,bloodTypeId=@bloodTypeId where Id=@id ";
             //��SQL��������еĲ���ȷ�����ͣ������θ�ֵ
             com.Parameters.Add(new SqlParameter("@LoginPwd", SqlDbType.VarChar, 50)).Value = item.LoginPwd;
             com.Parameters.Add(new SqlParameter("@nickName", SqlDbType.VarChar, 50)).Value = item.NickName;
             com.Parameters.Add(new SqlParameter("@faceId", SqlDbType.Int)).Value = item.FaceId;
             com.Parameters.Add(new SqlParameter("@sex", SqlDbType.VarChar, 50)).Value = item.Sex;
             com.Parameters.Add(new SqlParameter("@age", SqlDbType.Int)).Value = item.Age;
             com.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 50)).Value = item.Name;
             com.Parameters.Add(new SqlParameter("@starId", SqlDbType.Int)).Value = item.StarId;
             com.Parameters.Add(new SqlParameter("@bloodTypeId", SqlDbType.Int)).Value = item.BloodTypeId;
             com.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = item.Id;

             //ִ�����ݸ��²��������ر�Ӱ��ļ�¼����
             return dbo.UpDate(com);
         }

         /// <summary>
         /// ����������ɹ���QQ����
         /// </summary>
         /// <returns>����ɹ���QQ����</returns>
         public int getUserId()
         {
             //�������ݿ����ͨ�������
             DbOperate objOperate = new DbOperate();
             objOperate.TableName = "Users";
             //�������ݲ������󣬲���ʼ�佫ִ�е�SQL���
             SqlCommand com = new SqlCommand();
             com.CommandText = "select max(Id) from Users";
             //ִ��SQL��䣬����ѯ�������ݼ�����
             DataSet objSet=objOperate.Select(com);
             Console.WriteLine("����ֵ�ǣ�"+objSet.Tables["Users"].Rows[0][0]);
             //���ز�ѯ���ĵ�һ�����еĵ�һ�еĵ�һ�е�����
             return (int)objSet.Tables["Users"].Rows[0][0];
         }

         /// <summary>
         /// ���ݱ�Ų����û���Ϣ
         /// </summary>
         /// <param name="userid">�û����</param>
         /// <returns>�û�ʵ�����</returns>
         public UserItem LoadUser(int userid)
         {
             //�������ݿ����ͨ����
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;

             //�������ݲ�������
             SqlCommand com = new SqlCommand();

             //�����ѯ��䣬��ȷ���������������ֵ
             com.CommandText = "select * from users where id=@uid ";
             SqlParameter uid = new SqlParameter("@uid", SqlDbType.Int);
             uid.Value = userid;

             com.Parameters.Add(uid);

             DataTable table = dbo.Select(com).Tables[0];
             
             //���ݱ�Ž��в���
             if (table.Rows.Count == 1)
             {
                 this.view = table.DefaultView;
                 this.item = new UserItem();

                 //����ҵ���Ӧ��¼�������װ���û�ʵ�������
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

                 //���ظ��û�ʵ�����
                 return this.item;
             }
             else
             {
                 //���û�ҵ���Ӧ�û������ؿն���
                 return null;
             }
         }

         /// <summary>
         /// ���������û���Ϣ�б�
         /// </summary>
         /// <returns>�����û���Ϣ�б�</returns>
         public UserList LoadFrendList()
         {
             //�������ݿ����ͨ�����һ������
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;

             //�������ݲ������󣬲���ʼ���佫ִ�е�SQL���
             SqlCommand com = new SqlCommand();
             com.CommandText = "select * from Users";

             //ִ��SQL��䣬��ȡ�����ݼ��е����ݱ�
             DataTable table = dbo.Select(com).Tables[0];
             this.view = table.DefaultView;
             //�����������ݱ��е��û���Ϣ��ӵ��û��б����ϣ���
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
         /// ���������û���Ϣ�б�
         /// </summary>
         /// <returns>�����û���Ϣ�б�</returns>
         public UserList LoadFrendByCondition(string strSql)
         {
             //�������ݿ����ͨ�����һ������
             DbOperate dbo = new DbOperate();
             dbo.TableName = UsersOperator.TABLENAME;

             //�������ݲ������󣬲���ʼ���佫ִ�е�SQL���
             SqlCommand com = new SqlCommand();
             com.CommandText = strSql;

             //ִ��SQL��䣬��ȡ�����ݼ��е����ݱ�
             DataTable table = dbo.Select(com).Tables[0];
             //�����������ݱ��е��û���Ϣ��ӵ��û��б����ϣ���
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
    /// �û�ʵ����
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
    /// �û���Ϣ�б�
    /// </summary>
    public class UserList : IEnumerable
    {
        //����������װ��Ϣ��Ϣ�ļ���
        //private ArrayList list;
        public ArrayList list;
        public UserList()
        {
            this.list = new ArrayList();
        }

        /// <summary>
        /// ���û��б�������һ���û�����
        /// </summary>
        /// <param name="item">�û�ʵ�����</param>
        /// <returns>�û�ʵ��������û��б��е��±�</returns>
        public int Add(UserItem item)
        {
            return this.list.Add(item);
        }

        /// <summary>
        /// ���û��б����Ƴ�һ���û�ʵ�����
        /// </summary>
        /// <param name="item">�û�ʵ�����</param>
        public void Remove(UserItem item)
        {
            this.list.Remove(item);
        }

        /// <summary>
        /// �û�ʵ���б��е���Ϣʵ�������
        /// </summary>
        public int Length
        {
            get { return this.list.Count; }
        }

        /// <summary>
        /// ʵ���û��б�ļ򵥵���
        /// </summary>
        /// <returns>�û��б��е�ö��</returns>
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

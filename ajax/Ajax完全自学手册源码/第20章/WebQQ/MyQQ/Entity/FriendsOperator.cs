using System;
using System.Collections;
using System.Text;
using myqq.DataOperate;
using System.Data;
using System.Data.SqlClient;

namespace myqq.Entity
{
    /// <summary>
    /// 好友信息数据操作类
    /// </summary>
    public class FriendsOperator
    {
        private FriendList list;
        //好友信息实体类对象的数据表名称
        public const string TABLENAME = "Friends";

        public FriendsOperator()
        {
            this.list = new FriendList();
        }


        public int AddFriend(int hostId,int friendShipPolicy,int friendId)
        {
            DbOperate dbo = new DbOperate();
            dbo.TableName = FriendsOperator.TABLENAME;

            //定义数据操作对象，并初始化其将执行的SQL语句
            SqlCommand com = new SqlCommand();
            com.CommandText = string.Format("insert into Friends values({0},{1},null,{2})",hostId,friendShipPolicy,friendId);

            return dbo.Insert(com);
        }

        /// <summary>
        /// 根据用户编号，查找该用户的所有好友信息列表
        /// </summary>
        /// <param name="hostId">用户编号</param>\
        /// <param name="friendShipID">好友信息策略</param>
        /// <returns>该用户对应的好友信息列表</returns>
        public FriendList LoadFrendList(int hostId,int friendShipID)
        {
            //定义数据库操作通用类的一个对象
            DbOperate dbo = new DbOperate();
            dbo.TableName = FriendsOperator.TABLENAME;

            //定义数据操作对象，并初始化其将执行的SQL语句
            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from Friends where HostId=@HostId and FriendShipPolicy=@FriendShipPolicy";

            //对数据操作对象的SQL语句中的参数赋值
            SqlParameter hid = new SqlParameter("@HostId",SqlDbType.Int);
            hid.Value = hostId;

            SqlParameter friendShipPolicy = new SqlParameter("@FriendShipPolicy", SqlDbType.Int);
            friendShipPolicy.Value = friendShipID;

            com.Parameters.Add(hid);
            com.Parameters.Add(friendShipPolicy);

            //执行SQL语句，获取其数据集中的数据表
            DataTable table = dbo.Select(com).Tables[0];
            //迭代，将数据表中的好友信息添加到好友列表（集合）中
            foreach(DataRow row in table.Rows)
            {
                FriendItem item = new FriendItem();
                item.Id = Convert.ToInt32(row["id"]);
                item.HostId = Convert.ToInt32(row["HostId"]);
                item.FriendId = Convert.ToInt32(row["FriendId"]);
                item.FriendShipId = Convert.ToInt32(row["FriendShipPolicy"]);
                if (row["GroupId"] != null && row["GroupId"].ToString().Length >0)
                {
                    item.GroupId = Convert.ToInt32(row["GroupId"].ToString());
                }
                else
                {
                    item.GroupId = 0;
                }
                this.list.Add(item);
            }

            return this.list.Length >= 1 ? this.list : null;
        }

        /// <summary>
        /// 通过群组号获取群组人员ID
        /// </summary>
        /// <param name="groupId">群组ID</param>
        /// <returns>群组Friend列表</returns>
        public FriendList LoadFriendListByGroupId(int groupId)
        {
            this.list = new FriendList();
            DbOperate dbo = new DbOperate();
            dbo.TableName = FriendsOperator.TABLENAME;

            SqlCommand com = new SqlCommand();
            com.CommandText = string.Format("select * from Friends where groupId={0}",groupId);
            
            DataTable table = dbo.Select(com).Tables[0];
            foreach(DataRow row in table.Rows)
            {
                FriendItem item = new FriendItem();
                item.Id = Convert.ToInt32(row["id"]);
                item.HostId = Convert.ToInt32(row["HostId"]);
                item.FriendId = Convert.ToInt32(row["FriendId"]);
                item.FriendShipId = Convert.ToInt32(row["FriendShipPolicy"]);
                if (row["GroupId"] != null)
                {
                    item.GroupId = Convert.ToInt32(row["GroupId"]);
                }
                else
                {
                    item.GroupId = 0;
                }
                this.list.Add(item);
            }

            return this.list.Length >= 1 ? this.list : null;
        }

    }

    /// <summary>
    /// 好友信息实体类
    /// </summary>
    public class FriendItem
    {
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private int _hostId;

        public int HostId
        {
            get { return _hostId; }
            set { _hostId = value; }
        }
        private int _friendId;

        public int FriendId
        {
            get { return _friendId; }
            set { _friendId = value; }
        }

        private int _friendShipId;

        public int FriendShipId
        {
            get { return _friendShipId; }
            set { _friendShipId = value; }
        }

        private int _groupId;

        public int GroupId
        {
            get { return _groupId; }
            set { _groupId = value; }
        }





    }

    /// <summary>
    /// 好友信息集合类，实现了简单的迭代
    /// </summary>
    public class FriendList : IEnumerable 
    {
        //用来保存好友信息的集体
        private ArrayList list;

        public FriendList()
        {
            this.list = new ArrayList();
        }

        /// <summary>
        /// 获得该好友集合中好友的总个数
        /// </summary>
        public int Length
        {
            get { return this.list.Count; }
        }

        public FriendItem this[int index]
        {
            get
            {
                return (FriendItem)this.list[index];
            }
            set
            {
                this.list[index] = value;
            }
        }
        /// <summary>
        /// 往好友集合中添加一个好友
        /// </summary>
        /// <param name="item">好友实体对象</param>
        /// <returns>该好友在集合中的下标位置</returns>
        public int Add(FriendItem item)
        {
            return this.list.Add(item);    
        }
        /// <summary>
        /// 在好友集合中移除一个好友
        /// </summary>
        /// <param name="index">好友实体对象在集合中的下标</param>
        public void Remove(int index)
        {
            this.list.Remove(index);
        }
        /// <summary>
        /// 实现该好友集合的简单迭代
        /// </summary>
        /// <returns>返回好友集合的枚举对象</returns>
        public IEnumerator GetEnumerator()
        {
            return this.list.GetEnumerator();
        }

    }
}

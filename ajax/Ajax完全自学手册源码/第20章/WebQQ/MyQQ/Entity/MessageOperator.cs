using System;
using System.Collections.Generic;
using System.Text;
using myqq.DataOperate;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace myqq.Entity
{
    /// <summary>
    /// 消息数据操作类
    /// </summary>
    public  class MessageOperator
    {
        //消息信息所对应的数据表名称
        public const string TABLENAME = "Messages";
        public MessageOperator()
        { 
            
        }

        /// <summary>
        /// 获取一定事件范围内，特定好友的聊天记录
        /// </summary>
        /// <param name="hostid"></param>
        /// <param name="friendId"></param>
        /// <param name="time"></param>
        /// <returns></returns>
        public MessageList GetWeMsg(int hostid, int friendId, DateTime time)
        {
            DbOperate dbo = new DbOperate();
            dbo.TableName = MessageOperator.TABLENAME;
            MessageList returnList = new MessageList();

            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from Messages where toUserId=@hostID and fromUSerid=@friendId and MessageState=0 and MessageTime between @startTime and @endTime";

            SqlParameter hostPar = new SqlParameter("@hostID",SqlDbType.Int);
            hostPar.Value = hostid;

            SqlParameter friendPar = new SqlParameter("@friendId",SqlDbType.Int);
            friendPar.Value = friendId;

            SqlParameter start = new SqlParameter("@startTime",SqlDbType.DateTime);
            start.Value = time.AddSeconds(-2);

            SqlParameter end = new SqlParameter("@endTime",SqlDbType.DateTime);
            end.Value = time.AddSeconds(1);

            com.Parameters.Add(hostPar);
            com.Parameters.Add(friendPar);
            com.Parameters.Add(start);
            com.Parameters.Add(end);

            DataSet ds = dbo.Select(com);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                MessageItem item = new MessageItem();
                item.Id = Convert.ToInt32(row["Id"]);
                item.FromUserId = Convert.ToInt32(row["FromUserId"]);
                item.ToUserId = hostid;
                item.Message = row["Message"].ToString();
                item.MessageTypeId = Convert.ToInt32(row["MessageTypeId"]);
                item.MessageState = (MessageState)Convert.ToInt32(row["MessageState"]);
                item.MessageTime = Convert.ToDateTime(row["MessageTime"]);

                returnList.Add(item);
            }

            return returnList;
        }

        /// <summary>
        /// 更新消息列表中的消息为已读消息
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public MessageList UpdateMsg2Readed(MessageList list)
        {
            DbOperate dbo = new DbOperate();
            dbo.TableName = MessageOperator.TABLENAME;
            MessageList returnList = new MessageList();

            foreach (MessageItem item in list)
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "update Messages set MessageState=1 where Id=@MessageId";

                SqlParameter Idpar = new SqlParameter("@MessageId", SqlDbType.Int);
                Idpar.Value = item.Id;

                com.Parameters.Add(Idpar);
                dbo.UpDate(com);

                MessageItem upItem = this.GetMessage(item.Id);
                returnList.Add(upItem);
            }

            return returnList;
        }


        public MessageItem GetMessage(int itemid)
        {
            DbOperate dbo = new DbOperate();
            dbo.TableName = MessageOperator.TABLENAME;

            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from Messages where id=@MessageId";

            SqlParameter Idpar = new SqlParameter("@MessageId", SqlDbType.Int);
            Idpar.Value = itemid;

            com.Parameters.Add(Idpar);

            DataSet ds = dbo.Select(com);
            if(ds.Tables[0].Rows.Count>0)
            {
                DataRow row = ds.Tables[0].Rows[0];

                MessageItem item = new MessageItem();
                item.Id = Convert.ToInt32(row["Id"]);
                item.FromUserId = Convert.ToInt32(row["FromUserId"]);
                item.ToUserId = Convert.ToInt32(row["ToUserId"]);
                item.Message = row["Message"].ToString();
                item.MessageTypeId = Convert.ToInt32(row["MessageTypeId"]);
                item.MessageState = (MessageState)Convert.ToInt32(row["MessageState"]);
                item.MessageTime = Convert.ToDateTime(row["MessageTime"]);

                return item;
            }

            return null;
        }

        /// <summary>
        /// 得到按发送时间降序排列特定用户未读消息列表
        /// </summary>
        /// <param name="toUserId">接收消息的用户ID</param>
        /// <returns>消息列表</returns>
        public MessageList GetNoReadMessage4ToUserId(int toUserId)
        {
            DbOperate dbo = new DbOperate();
            dbo.TableName = MessageOperator.TABLENAME;

            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from Messages where toUserId=@toUserId and MessageState=0 order by MessageTime DESC";

            SqlParameter UserId = new SqlParameter("@toUserId",SqlDbType.Int);
            UserId.Value = toUserId;

            dbo.TableName = MessageOperator.TABLENAME;
            com.Parameters.Add(UserId);
            DataSet ds = dbo.Select(com);
            MessageList list = new MessageList();

            foreach(DataRow row in ds.Tables[0].Rows)
            {
                MessageItem item = new MessageItem();
                item.Id = Convert.ToInt32(row["Id"]);
                item.FromUserId = Convert.ToInt32(row["FromUserId"]);
                item.ToUserId = toUserId;
                item.Message = row["Message"].ToString();
                item.MessageTypeId = Convert.ToInt32(row["MessageTypeId"]);
                item.MessageState = (MessageState)Convert.ToInt32(row["MessageState"]);
                item.MessageTime = Convert.ToDateTime(row["MessageTime"]);

                list.Add(item);
            }

            return list;
        }

        /// <summary>
        /// 所有插入消息的状态都是未读消息
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public int InsertMessage(MessageItem item)
        {
            DbOperate dbo = new DbOperate();
            dbo.TableName = MessageOperator.TABLENAME;

            SqlCommand com = new SqlCommand();
            com.CommandText = "insert into Messages values(@fromUserId,@toUserId,@message,@messageTypeId,@messageState,@messageTime)";

            com.Parameters.Add(new SqlParameter("@fromUserId", SqlDbType.Int)).Value = item.FromUserId;
            com.Parameters.Add(new SqlParameter("@toUserId", SqlDbType.Int)).Value = item.ToUserId;
            com.Parameters.Add(new SqlParameter("@message", SqlDbType.VarChar,50)).Value = item.Message;
            com.Parameters.Add(new SqlParameter("@messageTypeId", SqlDbType.Int)).Value = item.MessageTypeId;
            com.Parameters.Add(new SqlParameter("@messageState", SqlDbType.Int)).Value = item.MessageState;
            com.Parameters.Add(new SqlParameter("@messageTime", SqlDbType.DateTime)).Value = item.MessageTime;

            return dbo.Insert(com);
        }

        /// <summary>
        /// 返回某用户的好友列表对象
        /// </summary>
        /// <param name="fromUserId">用户的MyQQ号</param>
        /// <returns></returns>
        public MessageList GetOwnerMsgByFromUser(int fromUserId)
        {
            DbOperate dbo = new DbOperate();
            dbo.TableName = MessageOperator.TABLENAME;

            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from Messages where fromUserId=@fromUserId";

            SqlParameter fUserId = new SqlParameter("@fromUserId",SqlDbType.Int);
            fUserId.Value = fromUserId;

            dbo.TableName = MessageOperator.TABLENAME;
            com.Parameters.Add(fUserId);

            DataSet ds = dbo.Select(com);
            MessageList list = new MessageList();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                MessageItem item = new MessageItem();
                item.Id = Convert.ToInt32(row["Id"]);
                item.FromUserId = Convert.ToInt32(row["FromUserId"]);
                item.ToUserId =Convert.ToInt32(row["TouserId"]);
                item.Message = row["Message"].ToString();
                item.MessageTypeId = Convert.ToInt32(row["MessageTypeId"]);
                item.MessageState = (MessageState)Convert.ToInt32(row["MessageState"]);
                item.MessageTime = Convert.ToDateTime(row["MessageTime"]);

                list.Add(item);
            }

            return list;
        }

        

    }

    /// <summary>
    /// 消息信息列表
    /// </summary>
    public class MessageList : IEnumerable
    {
        //真正用来封装消息信息的集合
        protected ArrayList list;

        public MessageList()
        {
            this.list = new ArrayList();
        }

        /// <summary>
        /// 往消息列表中增加一个消息对象
        /// </summary>
        /// <param name="item">消息实体对象</param>
        /// <returns>消息实体对象在消息列表中的下标</returns>
        public int Add(MessageItem item)
        {
            return this.list.Add(item);
        }

        /// <summary>
        /// 从消息列表中移除一个消息实体对象
        /// </summary>
        /// <param name="item">消息实体对象</param>
        public void Remove(MessageItem item)
        {
            this.list.Remove(item);
        }

        /// <summary>
        /// 消息实体列表中的消息实体的总数
        /// </summary>
        public int Length
        {
            get { return this.list.Count; }
        }
        
        /// <summary>
        /// 实现消息列表的简单迭代
        /// </summary>
        /// <returns>消息列表中的枚举</returns>
        public IEnumerator GetEnumerator()
        {
            return this.list.GetEnumerator();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <returns></returns>
        public MessageItem this[int index]
        {
            get {
                return (MessageItem)this.list[index];
            }
            set {
                this.list[index] = value;
            }
        }



    }
    /// <summary>
    /// 枚举：消息状态
    /// </summary>
    public enum MessageState
    {
        NoRead=0,Readed=1
    }

    /// <summary>
    /// 消息信息实体类
    /// </summary>
    public class MessageItem
    {
        public MessageItem()
        { 
        
        }

        private int _Id;

        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }
        private int _fromUserId;

        public int FromUserId
        {
            get { return _fromUserId; }
            set { _fromUserId = value; }
        }
        private int _toUserId;

        public int ToUserId
        {
            get { return _toUserId; }
            set { _toUserId = value; }
        }
        private string _message;

        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }
        private int _messageTypeId;

        public int MessageTypeId
        {
            get { return _messageTypeId; }
            set { _messageTypeId = value; }
        }
        private MessageState _messageState;

        public MessageState MessageState
        {
            get { return _messageState; }
            set { _messageState = value; }
        }
        private DateTime _messageTime;

        public DateTime MessageTime
        {
            get { return _messageTime; }
            set { _messageTime = value; }
        }
    }


}

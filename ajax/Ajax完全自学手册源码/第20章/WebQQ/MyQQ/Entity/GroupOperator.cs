using System;
using System.Collections.Generic;
using System.Text;
using myqq.DataOperate;
using myqq.Entity;
using System.Data;
using System.Data.SqlClient;

namespace MyQQ.Entity
{
    class GroupOperator
    {
        private DbOperate dbo;
        private const string TABLENAME="Group";


        public GroupOperator()
        {
            this.dbo = new DbOperate();
            this.dbo.TableName = GroupOperator.TABLENAME;
        }

        public GroupList GetAllGroupByHostId(int hostId)
        {
            SqlCommand com = new SqlCommand();
            string sql = "select * from Group where HostID={0}";
            sql = string.Format(sql,hostId);

            com.CommandText = sql;
            DataSet ds = this.dbo.Select(com);
            GroupList list = new GroupList();
            foreach(DataRow row in ds.Tables[GroupOperator.TABLENAME].Rows)
            {
                Group g = new Group();
                g.GroupID = Convert.ToInt32(row["GroupID"]);
                g.GroupName = row["GroupName"].ToString();
                g.GroupHostID = hostId;
                g.GroupDescription = row["GroupDescription"].ToString();
                g.GroupBuildTime = Convert.ToDateTime(row["GroupBuildTime"]);
                list.Add(g);
            }

            return list;
        }

        public Group GetGroupByGroupId(int groupId)
        {
            this.dbo = new DbOperate();
            SqlCommand com = new SqlCommand();
            string sql = "select * from Group where GroupId={0}";
            sql = string.Format(sql, groupId);

            com.CommandText = sql;
            DataSet ds = this.dbo.Select(com);
            Group g = new Group();

            if (ds.Tables[GroupOperator.TABLENAME].Rows.Count==1)
            {
                DataRow row = ds.Tables[GroupOperator.TABLENAME].Rows[0];
                g.GroupID = Convert.ToInt32(row["GroupID"]);
                g.GroupName = row["GroupName"].ToString();
                g.GroupHostID = Convert.ToInt32(row["HostId"]);
                g.GroupDescription = row["GroupDescription"].ToString();
                g.GroupBuildTime = Convert.ToDateTime(row["GroupBuildTime"]);
            }

            return g;
        }

        public GroupList GetGroupListByUserId(int uid)
        {
            this.dbo = new DbOperate();
            SqlCommand com = new SqlCommand();

            string sql = string.Format("select * from group where groupId in"+
                "(select * from friends where hostId={0} and friendId={0})",uid);

            com.CommandText = sql;
            DataTable table = this.dbo.Select(com).Tables[0];
            GroupList list = new GroupList();
            foreach(DataRow row in table.Rows)
            {
                Group g = new Group();
                g.GroupID = Convert.ToInt32(row["GroupID"]);
                g.GroupName = row["GroupName"].ToString();
                g.GroupHostID = Convert.ToInt32(row["HostId"]);
                g.GroupDescription = row["GroupDescription"].ToString();
                g.GroupBuildTime = Convert.ToDateTime(row["GroupBuildTime"]);
                list.Add(g);
            }

            return list;
        }
    }
}

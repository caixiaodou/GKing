using System;
using System.Collections;
using System.Text;
using myqq.DataOperate;

namespace MyQQ.Entity
{
    /// <summary>
    /// 群组的实体类
    /// </summary>
    public class Group
    {

        private int _groupID;         
        private string _groupName;         
        private int _groupHostID;         
        private DateTime _groupBuildTime;
        private string _groupDescription;

        public string GroupDescription
        {
            get { return _groupDescription; }
            set { _groupDescription = value; }
        }

        public  int GroupID
        {
            get   {return this._groupID;}
            set {this._groupID = value;}
        }

        public  string GroupName
        {
            get {return this._groupName;}
            set {this._groupName = value;}
        }


        public int GroupHostID
        {
            get {return this._groupHostID;}
            set {this._groupHostID = value; }
        }

        public  DateTime GroupBuildTime
        {
            get{  return this._groupBuildTime; }
            set  { this._groupBuildTime = value; }
        }
    }

    public class GroupList : IEnumerable
    {
        private ArrayList list;

        public GroupList()
        {
            this.list = new ArrayList();
        }

        public int Length
        {
            get { return this.list.Count; }
        }

        public int Add(Group g)
        {
           return  this.list.Add(g);
        }

        public void Remove(Group g)
        { 
            if(this.list.Contains(g))
            {
                this.list.Remove(g);
            }
        }

        public Group this[int index]
        {
            get
            {
                return (Group)this.list[index];
            }
            set
            {
                this.list[index] = value;
            }
        }



        #region IEnumerable 成员

        public IEnumerator GetEnumerator()
        {
            return this.list.GetEnumerator();
        }

        #endregion
    }
}

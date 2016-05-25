Ext.onReady(function(){
    Ext.QuickTips.init();	//支持tips提示
　　	Ext.form.Field.prototype.msgTarget='side';	//提示的方式，枚举值为"qtip","title","under","side",id(元素id)
　　       	//side方式用的较多，右边出现红色感叹号，鼠标上去出现错误提示，其他的我就不介绍了，可自行验证
　　		//大家可以分别去掉这两行代码，看效果就会明白他们的作用，（放在onReady的function（）{}中）

  Ext.apply(Ext.form.VTypes,{
　　               password:function(val,field)
                 {               //val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
　　               if(field.confirmTo)
                  {              //confirmTo是我们自定义的配置参数，一般用来保存另外的组件的id值
　　               var pwd=Ext.get(field.confirmTo);  //取得confirmTo的那个id的值
　　               return (val==pwd.getValue());
　　              }
　　              return true;
　　             }
　　});

    var f = new Ext.form.FormPanel({
        title : '填写信息',
        width : 400,
        height: 450,
        bodyBorder:false,
        labelAlign: 'right',
        frame : true,
        renderTo:"reg",
        items : [
            new Ext.form.TextField({
                name : 'username',
                allowBlank : false,
                blankText : "不能为空，请填写",
                regex: /^\w+$/, 
                regexText:"用户名只能由字母和数字组成！", 
                minLength : 6,
                minLengthText : "长度不能小于6个字符",
                maxLength : 15,              
                maxLengthText : "长度超过了15个字符",
                fieldLabel : '用户名',
                width:200
            }),{
			　           xtype:"combo",
			　           name: 'sex',
			　　       store:["男","女"],
			　　       fieldLabel:"性别",
			     allowBlank : false,
			     editable:false,
			　　        blankText : " 请选择性别",
				width:200
			　　         },
              {
                name : 'password1',
                id:"pass1",
                xtype : 'textfield',
                inputType : 'password',
                fieldLabel : '密码',
                allowBlank : false,
                blankText : "不能为空，请填写",
                width:180
            },
            {
                name : 'password2',
                id:"pass2",
                xtype : 'textfield',
                inputType : 'password',
                fieldLabel : '确认密码',
                allowBlank : false,
                blankText : "不能为空，请填写",
                vtype:"password",//自定义的验证类型
                vtypeText:"两次密码不一致！",
　　            			confirmTo:"pass1",//要比较的另外一个的组件的id
                width:180
            },
            {
                name : 'nickname',
                xtype : 'textfield',
                fieldLabel : '昵称',
                allowBlank : false,
                blankText : "不能为空，请填写",
                regex: /^\w+$/, 
                regexText:"呢称只能由字母和数字组成！", 
                minLength : 6,
                minLengthText : "长度不能小于6个字符",
                maxLength : 15,              
                maxLengthText : "长度超过了15个字符",
                width:180
            },
            {
                name : 'password',
                xtype : 'textfield',
                fieldLabel : '邮箱',
                allowBlank : false,
                blankText : "不能为空，请填写",
                vtype:"email",//email格式验证
　　            			vtypeText:"不是有效的邮箱地址",
                width:180
            },
             {
　　　　　　　　　　　　xtype: 'datefield',
　　　　　　　　　　　　fieldLabel: "注册日期", 
　　　　　　　　　　　　allowBlank: false,
		       editable:false,
               blankText : "不能为空，请选择",
　　　　　　　　　　　　name: "regdate",
　　　　　　　　　　　　id: "regday"
　　　　　　　　　　　 
		　　　　},/*{
		　              xtype:"combo",
		　              name: 'college',
		　　          store:["计算机科学与技术","电子工程","茶与生物学","动漫学院"],//数据源为一数组
		　　          fieldLabel:"学院",
              allowBlank : false,
              blankText : "请选择所在学院"
　　        		 },*/
             {
                name : 'comment',
                xtype : 'textarea',
                grow:true,
                fieldLabel : '备注',
                allowBlank : true,
                width:250
            }],
        buttons : [{
            text : '确定',
            handler : function () {
                var username = f.getForm().findField('username').getValue();
                var password = f.getForm().findField('password').getValue();
                Ext.Ajax.request({
                    url : 'RegServlet',
                    success : function (response, config) {
                        var flog = response.responseText;
                        if(0 == flog) {
                            Ext.MessageBox.alert('提示', '登录失败，没有查找到此用户');
                        } else if(1 ==flog) {
                            window.location = '/TeaHouse/UserServlet';
                        }
                    },
                    failure : function () {
                        Ext.MessageBox.alert('错误', '连接错误！');
                    },
                    method : 'post',
                    params : {username : username, password : password}
                });
            }
        },{
            text : '重置',
            handler : function () {
                f.getForm().reset();
            }
        }]
    });
    /*var window=new Ext.Window({
          title: "注册新账号",   
                height:490,
                width: 410,
               resizable:false,
               items:[f]
    })
    window.show();*/
});
//轮换图片
function tabs(se,ll,cur,prev,next,stop){
	var $obj=jQuery("#"+se);
	var len=$obj.length;
	var divs="";
	var c=1;
	for(var n=1;n<=len;n++){n==1?divs+="#"+ll+n:divs+=",#"+ll+n;};
	function showDiv($num){
		$obj.removeClass(cur);
		jQuery(divs).hide();
		jQuery($obj.get($num-1)).addClass(cur);
		jQuery("#"+ll+$num).show();
	};
	$obj.each(function(i){
		jQuery(this).mouseover(function(){
			c=i+1;showDiv(c);
		});
	});

	var interval=setInterval(function() {
					c++;c>len?c=1:c;showDiv(c);
				}, 5000);
	if(stop){
			$(stop).mouseover(function(){
			 clearInterval(interval);
			}).mouseout(function(){
				  interval=setInterval(function() {
					c++;c>len?c=1:c;showDiv(c);
				}, 5000);
			});
		}
}
/*歌曲列表标题*/
function cTab(obj, i){
    $('.tabs[data-for="'+obj+'"]').children('a').eq(i).blur().addClass('selected').siblings('a').removeClass('selected');
    $(obj).children('ul').eq(i).attr('data-selected','true').show().siblings('ul').removeAttr('data-selected').hide();
    $(obj).find('input:checkbox').attr('checked',false);
}
function cButtons(){
    var args = Array.prototype.slice.call(arguments);
    for(var i = 0, l = args.length; i < l; i++){
        (function(i){
            $('#' + args[i]+' .listAction a').each(function () {
                var m = $(this).attr('class'),
                    s = '#' + args[i]+' ul[data-selected] input:checkbox';
                if (m == 'add') {
                    $(this).mousedown(function () {
                        fns.add(s);
                    }).mouseup(function () {
                        fns.addlist(s);
                    }).click(function(){
                        return false;
                    });
                } else {
                    $(this).click(function () {
                        fns[m](s);
                        return false;
                    });
                }
            });
        })(i);
    }
}
window.fns = {
    selector: '#song-list input[name=checked]',
    select: function (selector, o) {
        if (typeof selector !== 'string') {
            selector = fns.selector;
        }
        $(selector).each(function () {
            this.checked = !this.checked;
        });
    },
    play: function (s, o) {
        var vs = fns['check'](s);
//        vs是一个js数组;
        alert(vs.length);
        //vs即选择歌曲的id,多个id用逗号隔开
//        vs.length > 0 ? window.open('/p_' + vs.join('_') + '.html', '_1ting') : alert('请选择歌曲！');
        if(vs.length>0){
        	for(var i=0;i<vs.length;i++){
        		alert(vs[i]);
        		$.post("playlist",{tid:vs[i],action:"addmore"});
        	}
        }else{
        	alert('请选择歌曲！');
        }
        	
    },
    fav: function (s) {
        var vs = fns['check'](s);
        vs.length > 0 ? window.tobox('http://box.1ting.com/service/addToFavorite.jsp?t=1&rID=' + vs.join(','), '_box') : alert('请选择歌曲！');
    },
    addlist: function (s, o) {
        if (!Dict.get('called')) {
            return false;
        }
        switch (Dict.get('called').constructor) {
        case Array:
            window.open(o ? '/album_' + o + '.html' : '/p_' + Dict.get('called').join('_') + '.html', '_1ting');
            break;
        case Boolean:
            alert('添加到列表!');
            break;
        case String:
            alert(Dict.get('called'));
            break;
        }
    },
    add: function (s, o) {
//        var vs = o || fns['check'](s);
//        if (vs.length > 0) {
//            try {
//                var fl = (function (n) {
//                    if (document[n]) {
//                        return document[n];
//                    } else if (document.getElementById(n)) {
//                        return document.getElementById(n);
//                    } else {
//                        return window[n];
//                    }
//                })('play_list_send');
//                fl.add_to_play_list(vs);
//            } catch (e) {
//                Dict.set('called', e.message);
//            }
//        } else {
//            Dict.set('called', '请选择歌曲！');
//        }
    	var vs = fns['check'](s);
        alert(vs.length);
        if(vs.length>0){
        	for(var i=0;i<vs.length;i++){
        		alert(vs[i]);
        		$.post("playlist",{tid:vs[i],action:"addmore"});
        	}
        }else{
        	alert('请选择歌曲！');
        }
    },
    check: function (selector) {
        var vs = [];
        if (typeof selector !== 'string') {
            selector = fns.selector;
        }
        $(selector).each(function () {
            if (this.checked) {
                vs.push(this.value);
            }
        });
        return vs;
    },
    playalbum: function (i) {
        try {
            fns.addlist(null, i);
        } catch (e) {}
    },
    addalbum: function () {
        try {
            var ids = [];
            $(fns.selector).each(function () {
                ids.push(this.value);
            });
            fns.add(null, ids);
        } catch (e) {}
    }
};
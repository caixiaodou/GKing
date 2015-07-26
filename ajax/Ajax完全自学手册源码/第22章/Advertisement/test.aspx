<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>内文广告系统测试页面</title>
</head>
<body><form id="form1" runat="server">
    
    <div><h2 style="text-align: center">内文广告系统测试页面</h2>
        <div>Ajax全称为&ldquo;Asynchronous JavaScript and XML&rdquo;
        （异步JavaScript和XML），
        是指一种创建交互式网页应用的网页开发技术。
        Ajax技术是目前在浏览器中通过JavaScript脚本可以使用的所有技术的集合。
        Ajax以一种崭新的方式来使用所有的这些技术，
        使得古老的B/S方式的Web开发焕发了新的活力。</div>                     
           <div>Ajax技术之中，最核心的技术就是XMLHttpRequest，
           它最初的名称叫做XMLHTTP，是微软公司为了满足开发者的需要，
           1999年在IE5.0浏览器中率先推出的。后来这个技术被上述的规范命名为XMLHttpRequest。
           它正是Ajax技术之所以与众不同的地方。简而言之，
           XMLHttpRequest为运行于浏览器中的JavaScript脚本提供了一种在页面之内与服务器通信的手段。
           页面内的JavaScript可以在不刷新页面的情况下从服务器获取数据，或者向服务器提交数据。
           XMLHttpRequest的出现为Web开发提供了一种全新的可能性，
           甚至整个改变了人们对于Web应用由什么来组成的看法。
           它可以使我们以一种全新的方式来做Web开发，为用户提供更好的交互体验。</div>
             <div>与传统的Web开发不同，
             Ajax并不是以一种基于静态页面的方式来看待Web应用的。
             从Ajax的角度看来，Web应用应由少量的页面组成，其中每个页面其实是一个更小型的Ajax应用。
             每个页面上面都包括有一些使用JavaScript开发的Ajax组件。
             这些组件使用XMLHttpRequest对象以异步的方式与服务器通信，
             从服务器获取需要的数据后使用DOM API来更新页面中的一部分内容。
             因此Ajax应用与传统的Web应用的区别主要在三个地方：</div>                        
             <div>1. 不刷新整个页面，在页面内与服务器通信。</div>                       
              <div>2. 使用异步方式与服务器通信，不需要打断用户的操作，具有更加迅速的的响应能力。</div>                        <div>3. 应用仅由少量页面组成。大部分交互在页面之内完成，不需要切换整个页面。</div>                        <div>由此可见，Ajax使得Web应用更加动态，带来了更高的智能，并且提供了表现能力丰富的Ajax UI组件。这样一类新型的Web应用叫做RIA（Rich Internet Application）应用。</div>  
    
    </div>
    </form>
</body>
</html>
<script type="text/javascript" src="Js/getAdvertise.js"></script>
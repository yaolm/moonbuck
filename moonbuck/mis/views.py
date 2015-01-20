# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template, Context, RequestContext, loader
from django.template.loader import get_template
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
import datetime

from django.db.models import *
from moonbuck.mis.models import *

def homepage(request):
    return render_to_response('index.html',locals())

def crmHome(request):
    return render_to_response('CRM首页.html',locals())

def prmHome(request):
    return render_to_response('PRM首页.html',locals())

@csrf_exempt
#这里还是有问题，跳不过去，ＴＡＴ
def crm_adduser(request):
    errors = []
    if request.method == 'POST':
        if not errors:
            userno = request.POST['userno']
            username = request.POST['username']
            email = request.POST['email']
            mob_num = request.POST['mob_num']
            birthyear = request.POST['birthyear']
            birthmonth = request.POST['birthmonth']
            birthday = request.POST['birthday']
            address = request.POST['address']
            cryear = request.POST['cryear']
            crmonth = request.POST['crmonth']
            crday = request.POST['crday']

            temp = customer(cuId=userno,cuName=username,cuEmail=email,cuPhone=mob_num,cuCreate=crday)
            temp.save()

            return HttpResponseRedirect('/crm/')
    
    return render_to_response('add_customer.html',locals())


def crm_user_search(request):
    return render_to_response('CRM检索页面.html',locals())

def crm_user_searchresult(request):
    if request.method == 'GET':
        if 'participant1' & 'textcontent1' in request.GET:
            participant1 = request.GET['participant1'][0]
            textcontent1 = request.GET['textcontent1'][0]
            print(participant1)
            if participant1 == 2:
                record = customer.objects.filter(cuName=textcontent1)
            return render_to_response('CRM查询结果.html',locals())
        else:
            return HttpResponse("something to response")
            #return render_to_response('CRM检索页面.html',locals())
    elif request.method == 'POST':
        query = request.POST
        print(query)
        if query.get('participant1')[0] == '1':
            return HttpResponse("nothing to response")
        else:
            p1 = query['participant1'][0]
            t1 = query['textcontent1'][0]
            if p1 == '2':
                print("Right!")
                record = customer.objects.filter(cuName=t1)
            elif p1 == '3':
                record = customer.objects.filter(cuEmail=t1)
            elif p1 == '4':
                record = customer.objects.filter(cuScore=int(t1))
            elif p1 == '5':
                # 这里还没统计已有订单来计算总消费额
                pass
            elif p1 == '6':
                record = customer.objects.filter(cuType=t1)
            elif p1 == '7':
                record = customer.objects.filter(cuId=int(t1))
            # 不知道为什么结果集总是空的
            print(record)
            template = loader.get_template('CRM查询结果.html')
            context = RequestContext(request, {'record':record,})
            return HttpResponse(template.render(context))

#这里有数据库增加，把商品进行了更新，还没有写积分计算方法的提交
def favor(request):
    record=good.objects.all()
    return render_to_response('credit.html',locals())

#√
def crmproject(request):
    record = project.objects.all()
    return render_to_response('CRM优惠项目进程.html',locals())

def crmaddproject(request):
    return render_to_response('add_benefit_item.html',locals())
def crmprojectdetail(request):
    #需要按照优惠的类型返回不同的页面，
    if request.method == "POST":
        q=request.POST
        items=q['items'][0]
        print(items)
        if items == 1:
            return HttpResponseRedirect('/crm/project/add')
        if items == 2:
            return render_to_response('youhuizhengce_maijiusong.html',locals())
        if items == 3:
            return render_to_response('youhuizhengce_manjiusong.html',locals())
        if items == 4:
            return render_to_response('youhuizhengce_tejiashangpin.html',locals())
        if items == 5:
            return render_to_response('youhuizhengce_manjiujian.html',locals())
        if items == 6:
            return render_to_response('youhuizhengce_jifenduihuan.html',locals())
        if items == 7:
            return render_to_response('youhuizhengce_xinpinchangxianjia.html',locals())

    return render_to_response('add_benefit_item.html',locals())

#√
def prmproject(request):
    record=orderMedia.objects.all()
    return render_to_response('已有公关媒体信息.html',locals())
#入口存疑
def prmprojectdetail(request):
    return render_to_response('PRM项目进程.html',locals())
#
def additem(request):
    return render_to_response('add_public_item.html',locals())
def addmedia(request):
    return render_to_response('add_public_relation.html',locals())
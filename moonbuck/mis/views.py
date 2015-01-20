# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template, Context, RequestContext, loader
from django.template.loader import get_template
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
import datetime
from django.db import connection

from django.db.models import *
from moonbuck.mis.models import *

def homepage(request):
    return render_to_response('index.html',locals())

def crmHome(request):
    return render_to_response('CRM首页.html',locals())

def prmHome(request):
    return render_to_response('PRM首页.html',locals())

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
        #print(query)
        if query.get('participant1') == '1':
            return HttpResponse("nothing to response")
        else:
            p1 = query['participant1']
            t1 = query['textcontent1']
            raw_sql = 'SELECT sum(orOff) FROM mis_order WHERE orCu_id IN (SELECT id FROM mis_customer WHERE '
            cursor = connection.cursor()
            if p1 == '2':
                record = customer.objects.filter(cuName=t1)
                raw_sql += 'cuName ="' + t1 + '") GROUP BY orCu_id;'
                #print(raw_sql)
                cursor.execute(raw_sql)
                cuSum = cursor.fetchone()[0]
                #print(cuSum)
            elif p1 == '3':
                record = customer.objects.filter(cuEmail=t1)
                raw_sql += 'cuEmail ="' + t1 + '") GROUP BY orCu_id;'
                cursor.execute(raw_sql)
                cuSum = cursor.fetchone()[0]
            elif p1 == '4':
                record = customer.objects.filter(cuScore=int(t1))
                raw_sql += 'cuScore =' + int(t1) + ') GROUP BY orCu_id;'
                cursor.execute(raw_sql)
                cuSum = cursor.fetchone()[0]
            elif p1 == '5':
                rc_sql = "SELECT * FROM mis_customer WHERE id IN (SELECT orCu_id FROM mis_order GROUP BY orCu_id HAVING sum(orOff)=" + t1 + ');'
                print(rc_sql)
                record = order.objects.raw(rc_sql)
                cuSum = int(t1)
            elif p1 == '6':
                record = customer.objects.filter(cuType=t1)
                raw_sql += 'cuType ="' + t1 + '") GROUP BY orCu_id;'
                cursor.execute(raw_sql)
                cuSum = cursor.fetchone()[0]
            elif p1 == '7':
                record = customer.objects.filter(cuId=int(t1))
                raw_sql += 'cuId =' + int(t1) + ') GROUP BY orCu_id;'
                cursor.execute(raw_sql)
                cuSum = cursor.fetchone()[0]
            else:
                record = customer.objects.all()
            print(record)
            template = loader.get_template('CRM查询结果.html')
            context = RequestContext(request, {'record':record,'cuSum':cuSum,})
            return HttpResponse(template.render(context))

#这里有数据库增加，把商品进行了更新，还没有写积分计算方法的提交
def favor(request):
    if request.method == 'GET':
        record = good.objects.all()
        template = loader.get_template('credit.html')
        context = RequestContext(request, {'record':record})
        return HttpResponse(template.render(context))
    elif request.method == 'POST':
        return render_to_response('creadit.html',locals())
    else:
        return render_to_response('creadit.html',locals())

#√
def crmproject(request):
    record = project.objects.all()
    return render_to_response('CRM优惠项目进程.html',locals())

def crmaddproject(request):
    if request.method == 'GET':
        pass
    elif request.method == 'POST':
        pass
    return render_to_response('add_benefit_item.html',locals())

def crmprojectdetail(request):
    #需要按照优惠的类型返回不同的页面，
    if request.method == "POST":
        q = request.POST
        items = int(q['items'])
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
    record = orderMedia.objects.all()
    return render_to_response('已有公关媒体信息.html',locals())
#入口存疑
def prmprojectdetail(request):
    return render_to_response('PRM项目进程.html',locals())
#
def additem(request):
    return render_to_response('add_public_item.html',locals())
def addmedia(request):
    return render_to_response('add_public_relation.html',locals())
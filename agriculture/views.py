from django.shortcuts import render
import re
from django.shortcuts import redirect
from django.db import connection, transaction
from django.http import HttpResponse, HttpResponseNotFound
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

# Create your views here.
def index(request):
    return render(request, "home.html")

def insertSuccess(request):
    return render(request, 'insertSuccess.html')

def insertCall(request):
    return render(request, 'insert.html')

def insert(request):
    s =""
    if request.method == "GET":
        return HttpResponse("get request")
    else:
        firstName = request.POST.get('firstName')
        secondName = request.POST.get('secondName')

        address2 = request.POST.get('address2')
        address1 = request.POST.get('address1')
        city = request.POST.get('city')

        dob = request.POST.get('dob')
        joiningDate = request.POST.get('joiningDate')

        empId = request.POST.get('empId')
        email = request.POST.get('email')
        qualification = request.POST.get('qualification')

        department = request.POST.get('department')

        gender = request.POST.get('gender')

        contact = request.POST.get('contactNo')
        userName = request.POST.get('userName')
        password = request.POST.get('password')

        cursor = connection.cursor()

        flag = 0

        if firstName != None or secondName != None or address2!= None or address1!= None or city!= None or dob != None or joiningDate!= None or empId != None or email!= None or qualification!= None or department!= None or gender != None or contact!= None or userName != None or password != None :
            flag = 1

        if not (re.search('[\d]{10}', contact)):
            flag = 0
            s += "length of contact is less than 10 characters\n"

        if dob > joiningDate:
            flag = 0
            s += "dob is coming after joining date\n"

        user = User.objects.create_user(userName, "", password)
        user.save()

        cursor.execute("select deptId from department where deptName=\""+department +"\";")
        row = cursor.fetchone()
        if row and flag == 1:
            print(row)
            deptId = row[0]
            cursor.execute("insert into personalInfo values(\""+empId+"\",\""+str(deptId)+"\",\""+dob+"\",\""+joiningDate+"\" ,null,null);")

            cursor.execute("insert into address (address1, address2, city, empId) values(\""+address1+"\", \""+address2+"\", \""+city+"\",+\""+empId+"\");")
            cursor.execute("insert into emailaddresses values(\""+email+"\",\""+empId+"\");")

            cursor.execute("insert into phone_num values(\""+contact+"\",\""+empId+"\");")

            cursor.execute("insert into name (firstName, secondName, empId) values(\""+firstName+"\",\""+secondName+"\",\""+empId+"\");")

            cursor.execute("insert into credentials values(\""+userName+"\",\""+password+"\",\""+empId+"\");")

            cursor.execute("update department set noOfEmployees= noOfEmployees+ 1 where deptId = \""+str(deptId)+"\"")

            flag = 1

        if flag == 1:
            return render(request, 'insertSuccess.html')
        else:
            return render(request, 'insert.html', {'ss':s})
    return render(request, 'insert.html')

def logout_view(request):
    logout(request)
    return render(request, 'logout.html')

def login1(request):
    return render(request, 'login.html')

def loginAuth(request):
    flag = 0
    if(request.POST):
        username = request.POST.get('username')
        password = request.POST.get('password')
        empId = request.POST.get('empId')
        cursor = connection.cursor()
        cursor.execute("select count(*) from credentials where username=\""+username +"\" and password =\"" + str(password) + "\";")
        row = cursor.fetchone()

        user = authenticate(username=username, password=password)
        print("user", user)

        if(row[0] == 1) and user is not None:
            flag = 1
            login(request, user)
            return render(request, 'loginAuth.html')
        else:
            return render(request, 'login.html', {'flag':flag})
    else:
        return render(request, 'loginAuth.html', {'flag':flag})

@login_required
def updateAddress(request):
    return render(request, 'updateAddress.html')

@login_required
def updateAddressFinal(request):
    s = ""
    if(request.POST):
        add1=request.POST.get('add1')
        add2=request.POST.get('add2')
        city=request.POST.get('city')
        if User.is_authenticated:
            userName=request.user.get_username()
        else:
            s += "user is not authenticated\n"
            return render(request, 'updateaddressfinal.html',{'ss':s})
        print(userName)

        cursor = connection.cursor()

        cursor.execute("select empId from credentials where username=\""+userName+"\";")
        row = cursor.fetchone()
        empId = str(row[0])

        cursor.execute("update address set address1=\""+add1+"\"where empId=\""+str(empId)+"\";")
        cursor.execute("update address set address2=\""+add2+"\"where empId=\""+str(empId)+"\";")
        cursor.execute("update address set city=\""+city+"\"where empId=\""+str(empId)+"\";")
        return render(request, 'updateaddressfinal.html')

    else:
        return render(request, 'updateaddressfinal.html')
@login_required
def supervises(request):
    return render(request, 'supervises.html')
@login_required
def supervisesFin(request):
    s = ''
    if(request.POST):
        supervisor=request.POST.get('supervisor')
        supervised=request.POST.get('supervised')
        task=request.POST.get('task')

        flag = 1
        cursor= connection.cursor()
        if supervisor == supervised:
            s += 'both id were same, please try again'
            flag = 0

        if flag == 1:
            cursor.execute("insert into supervises values(\""+str(supervisor)+"\",\""+str(supervised)+"\",\""+task+"\");")

            return render(request, 'supervisesfin.html')
        else:
            return render(request, 'supervises.html',{'ss':s})

@login_required
def printData(request):
    s = ''
    if (request.GET):
        if User.is_authenticated:
            userName=request.user.get_username()
        else:
            s += "user is not authenticated\n"
            return render(request, 'updateaddressfinal.html',{'ss':s})
        print(userName)
        cursor = connection.cursor()

        cursor.execute("select empId from credentials where username=\""+userName+"\";")
        row = cursor.fetchone()
        empId = str(row[0])


        return render(request, 'print.html')

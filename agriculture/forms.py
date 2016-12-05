from django import forms

class signInForm(forms.Form):
    firstName = forms.CharField(max_length=64)
    secondName = forms.CharField(max_length=64)
    gender = forms.BooleanField()
    address1 = forms.CharField(max_length=64)
    address2 = forms.CharField(max_length=64)
    city = forms.CharField(max_length=64)
    dob = forms.DateField()
    qualification = forms.CharField()
    department = forms.CharField()
    contact = forms.IntegerField()
    email = forms.EmailField(max_length=64)

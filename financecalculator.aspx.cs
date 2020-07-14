using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace EducationalApps
{
    public partial class financecalculator : System.Web.UI.Page
    {
        //declare global variables
        int _payment;
        float _annualInterest;
        int _loanLength;

        protected void Page_Load(object sender, EventArgs e)
        {

            for (double i = 3.0; i <= 10; i += .125)
            {
                ddlInterest.Items.Add(new ListItem(i.ToString())); //dynamically populate the Dropdown Menu, & cast each entry to a string
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            initLoanValues();
            displayMonthlyPayment(calcPayment());
        }

        void initLoanValues()
        {
            //Initialize global variables
            //The Convert.ToInt32 casts the text (which is stripped of commas with Replace) to an Integer
            _payment = Convert.ToInt32(txtPrincipal.Text.Replace(",", ""));
            _annualInterest = float.Parse(ddlInterest.SelectedItem.Text);
            _loanLength = int.Parse(ddlYears.SelectedItem.Text);
        }

        decimal calcPayment()
        {
            //Cast _annualInterest to a decimal and ensure values being divided are decimals by adding .0m after the values.
            decimal j = (decimal)_annualInterest / (12.0m * 100.0m);
            int n = _loanLength * 12;
            decimal monthlyPayment;
            //first calculate 1 + j then take that to the -n (minus n) power, subtract that from the number 1.
            //Now take the inverse of that. Then multiply the result times j and then times p.
            //Math.Pow returns a double, so it has to be cast to a decimal
            monthlyPayment = _payment * (j / (1.0m - (decimal)Math.Pow((1.0 + (double)j), -n)));
            return monthlyPayment;
        }

        void displayMonthlyPayment(decimal m)
        {
            lblMonthlyPayment.Text = (m).ToString("C"); //This takes the value passed and applies a currency formatting.
        }

    }
}
using System.Net.Mail;

namespace ShopEnMart.Utility
{
    public class EmailNotification
    {
        public static void SendMail(string recipientAddress, string emailSubject, string emailBody)
        {
            emailBody = emailBody.Replace("_RouteUrlPath", System.Configuration.ConfigurationManager.AppSettings["ApplicationRootUrl"]);
            var EmailRecipientList = recipientAddress.Split(',');
            SmtpClient smtp = new SmtpClient();
            MailMessage mail = new MailMessage();
            mail.Body = emailBody;
            mail.Subject = emailSubject;
            foreach (var user in EmailRecipientList)
                mail.To.Add(new MailAddress(user.ToString()));
            mail.IsBodyHtml = true;
            smtp.Send(mail);
        }
    }
}
const nodemailer = require('nodemailer');
const config = require('../../configs/app');
const inviteEmail = require('../../templates/email/invite-email');
const forgotPasswordEmail = require('../../templates/email/forgot-password-email');

const transporter = nodemailer.createTransport({
  host: config.emailHost,
  port: config.emailPort,
  auth: {
    user: config.emailUser,
    pass: config.emailPassword,
  },
});
transporter.verify().then(console.log('registered smtp server')).catch(console.error);

const sendInviteEmail = async (toEmail, emailToken, expireDate, name) => {
  transporter
    .sendMail({
      from: `"${config.emailSenderName}" < ${config.emailSenderMail} >`, // sender address
      to: toEmail, // list of receivers
      subject: 'Invite email', // Subject line
      html: inviteEmail(emailToken, expireDate, name || 'Guest', config.feURL), // html body
    })
    .then((info) => {
      console.log({ info });
    })
    .catch(console.error);
};

const sendResetPasswordEmail = async (toEmail, resetPasswordToken, name) => {
  transporter
    .sendMail({
      from: `"${config.emailSenderName}" < ${config.emailSenderMail} >`, // sender address
      to: toEmail, // list of receivers
      subject: 'Forgot password email', // Subject line
      html: forgotPasswordEmail(resetPasswordToken, name || 'Guest', config.feURL), // html body
    })
    .then((info) => {
      console.log({ info });
    })
    .catch(console.error);
};

module.exports = {
  sendInviteEmail,
  sendResetPasswordEmail,
};

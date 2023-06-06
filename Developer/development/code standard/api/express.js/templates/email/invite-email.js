module.exports = (emailToken, expireDate, name, feURL) => {
  return `
            <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta http-equiv="Content-Type" content="text/html charset=UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link href="https://fonts.googleapis.com/css?family=Prompt&display=swap" rel="stylesheet">
                    <title>Document</title>
                    <style type="text/css">
                        body {
                            padding: 0;
                            margin: 0;
                            font-family: 'prompt', sans-serif !important;
                        }
                        h1,
                        h2,
                        p {
                            padding: 0;
                            margin: 0;
                        }
                        .heading-1 {
                            font-weight: 600;
                            font-size: 24px;
                            line-height: 30px;
                            color: #000000;
                        }
                        .body-1 {
                            font-weight: 300;
                            font-size: 16px;
                            line-height: 24px;
                            color: #3C444B;
                        }
                        .body-2 {
                            font-weight: 300;
                            font-size: 14px;
                            line-height: 22px;
                            color: #747B83;
                        }
                        .card-container {
                            width: 100%;
                            max-width: 640px;
                            background: #FFFFFF;
                            box-shadow: 0px 0px 10px rgba(116, 123, 131, 0.15);
                        }
                        .header {
                            padding: 40px 48px;
                        }
                        .content {
                            padding: 40px 40px 10px 40px;
                        }
                        .footer {
                            padding: 24px 48px;
                        }
                        .logo {
                            width: 184px;
                            height: 24px;
                        }
                        .logo>img {
                            width: 100%;
                            height: 100%;
                        }
                        .expire {
                            font-weight: 300;
                            font-size: 16px;
                            line-height: 24px;
                            color: #FF0000;
                        }
                        .link-button {
                            width: 210px;
                            margin-top: 40px;
                        }
                        .link-button a {
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            background: #2E53A3;
                            color: white !important;
                            border-radius: 6px;
                            border: none;
                            font-weight: 600;
                            font-size: 16px;
                            line-height: 24px;
                            cursor: pointer;
                            text-decoration: none;
                            padding: 13px 48px;
                        }
                        .email {
                            color: #307DF1;
                        }
                        .divide {
                            border-bottom: 1px solid #eaeaec;
                        }
                        .copyright {
                            margin-top: 24px;
                        }
                        @media screen and (max-width: 1365px) {
                            .header,
                            .content,
                            .footer {
                                padding: 16px;
                            }
                        }
                    </style>
                </head>
                <body>
                    <div class="card-container">
                        <div class="header">
                            <div class="logo">
                                <img src="https://i.ibb.co/4tXdWBb/logo.png"
                                    alt="logo" />
                            </div>
                        </div>
                        <div class="divide"></div>
                        <div class="content">
                            <h1 class="heading-1">Welcome!</h1>
                            <h2 class="heading-1">Please setup your account.</h2>
                            <p class="body-1" style="margin-top: 24px;">Hi ${name},</p>
                            <div class="body-1" style="margin-top: 24px;">
                                Please click accept invite to setup password and join the REPCONEX AIMS-DMS application. <span
                                    class="expire">Expire : ${new Date(expireDate).toLocaleString('en-US', {
                                      timezone: 'Asia/Bangkok',
                                    })}.</span>
                            </div>
                            <p class="body-1" style="margin-top: 24px;">Best regards,</p>
                            <p class="body-1">Support Team</p>
                            <div class="link-button">
                                <a href="${feURL}/auth/setup-account?emailToken=${emailToken}"
                                    class="setup-account-btn" target="_blank">Setup account</a>
                            </div>
                        </div>
                        <div class="footer">
                            <div class="body-2">Let us know if you have any questions. <span class="email">email@repconex.com</span>.
                                Please contact our support team.
                            </div>
                            <div class="body-2 copyright">© Copyright 2022 | REPCONEX</div>
                        </div>
                    </div>
                </body>
            </html>
    `;
};

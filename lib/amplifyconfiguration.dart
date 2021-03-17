const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-2:f990c8d3-2e42-4645-8789-5915f7f93c80",
                            "Region": "us-east-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-2_6pmwjGH3H",
                        "AppClientId": "oeer1kglmapdgknbor663ucis",
                        "Region": "us-east-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "cloudnesilthesiscancer-dev.auth.us-east-2.amazoncognito.com",
                            "AppClientId": "oeer1kglmapdgknbor663ucis",
                            "SignInRedirectURI": "https://www.cancer.cloudnesil.com/signin/",
                            "SignOutRedirectURI": "https://www.cancer.cloudnesil.com/",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://p3o4h4hvjnbo7egioreosmys7u.appsync-api.us-east-2.amazonaws.com/graphql",
                        "Region": "us-east-2",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "thesiscancergraphql_AMAZON_COGNITO_USER_POOLS"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "thesiscancergraphql": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://p3o4h4hvjnbo7egioreosmys7u.appsync-api.us-east-2.amazonaws.com/graphql",
                    "region": "us-east-2",
                    "authorizationType": "AMAZON_COGNITO_USER_POOLS"
                }
            }
        }
    }
}''';
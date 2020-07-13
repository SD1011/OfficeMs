const jwt = require('jsonwebtoken');
process.env.SECRET_KEY = '#@securekey$#0519238476';

exports.isauthenticatedJWT = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    
    if (authHeader) {
       jwt.verify(authHeader, process.env.SECRET_KEY,{ algorithm:'HS256'}, (err, user) => {
            if (err) {
                return res.sendStatus(403);
            }

            req.userID = user._uId;
           
            req.compID = user._cID;
            
            next();
        });
    } else {
        res.sendStatus(401);
    }
};
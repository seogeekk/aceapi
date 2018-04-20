var express = require('express');
var router = express.Router();

var auth = require('./auth');
var user = require('./handlers/user-handler');
var customer = require('./handlers/customer-handler');
var staff = require('./handlers/staff-handler');
var property = require('./handlers/property-handler');
var claim = require('./handlers/claim-handler');
var worklog = require('./handlers/worklog-handler');
var inspection = require('./handlers/inspection-handler');
var smsapi = require('../functions/sms');
var addressapi = require('../functions/address');
var aceconfig = require('./handlers/aceconfig-handler');
var notification = require('./handlers/notification-handler');


/**
 * @swagger
 *
 *  definitions:
 *    user:
 *      type: object
 *      properties:
 *        username:
 *          type: string
 *        firstname:
 *          type: string
 *        lastname:
 *          type: string
 *        roleid:
 *          type: integer
 *        status:
 *          type: integer
 *
 *
 *    property:
 *      type: object
 *      properties:
 *        propertyid:
 *          type: integer
 *        propertyname:
 *          type: string
 *        address1:
 *          type: string
 *        address2:
 *          type: string
 *        suburb:
 *          type: string
 *        state:
 *          type: string
 *        postcode:
 *          type: integer
 *        country:
 *          type: string
 *        propertytype:
 *          type: integer
 *        latitude:
 *          type: integer
 *        longitude:
 *          type: integer
 *
 *    newclaim:
 *      type: object
 *      properties:
 *        propertyid:
 *          type: integer
 *        claimtypeid:
 *          type: integer
 *        summary:
 *          type: string
 *        description:
 *          type: string
 *        submitteduser:
 *          type: string
 *
 *    claim:
 *      type: object
 *    properties:
 *      claimid:
 *        type: integer
 *      propertyid:
 *        type: integer
 *      claimtypeid:
 *        type: integer
 *      summary:
 *        type: string
 *      description:
 *        type: string
 *      submitteduser:
 *        type: string
 *      status:
 *        type: integer
 *
 *
 *
*/

/**
 * @swagger
 *
 *  securityDefinitions:
 *    apikey1:
 *      type: apiKey
 *      in: header
 *      name: x-access-token
 *    apikey2:
 *      type: apiKey
 *      in: header
 *      name: x-key
 *
 * /login:
 *  post:
 *    description: Login user
 *    tags:
 *    - auth
 *    produces:
 *      application/json
 *    parameters:
 *    - in: body
 *      name: body
 *      required: true
 *      schema:
 *        type: object
 *        properties:
 *          username:
 *            type: string
 *          password:
 *            type: string
 *    responses:
 *     200:
 *       description: successful operation
 *       schema:
 *         type: object
 *         properties:
 *           token:
 *             type: string
 *           expires:
 *             type: integer
 *           user:
 *             type: object
 *             $ref: "#/definitions/user"
 */
router.post('/login', auth.login);

// TODO : Add middleware to require JWT
router.post('/changepasswd', user.changePassword);
router.post('/createuser', user.createNewUser);


/*
  /api/v1/users
 */
var apiversion = '/api/v1/';

// User
router.get(apiversion + 'user/getuserid/:username', user.getUserID);
router.post(apiversion + 'user/update', user.updateUser);
/**
 * @swagger
 * /api/v1/user/{username}:
 *   get:
 *     tags:
 *     - user
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Get User details
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: username
 *        in: path
 *        type: string
 *     responses:
 *       200:
 *         description:
 */
router.get(apiversion + 'user/:username', user.getUserDetails);
router.get(apiversion + 'user/', user.getAllUsers);
router.get(apiversion + 'user/getrole/:username', user.getUserRole);
router.post(apiversion + 'user/changestatus', user.changeUserStatus);

// Customer
router.post(apiversion + 'customer/new', customer.createNewCustomer);
router.get(apiversion + 'customer/search/', customer.searchCustomer);
router.get(apiversion + 'customer/:username', customer.getCustomerDetails);
router.get(apiversion + 'customer/', customer.getAllCustomers);
router.post(apiversion + 'customer/update', customer.updateCustomerDetails);


// Staff
/**
 * @swagger
 * /api/v1/staff/new:
 *   post:
 *     tags:
 *     - staff
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Create new staff
 *     produces:
 *       - application/json
 *     parameters:
 *       - name: username
 *       - name: staffname
 *       - name: department
 *       - name: accesstype
 *     responses:
 *       200:
 *         description: login
 */
router.post(apiversion + 'staff/new', staff.createNewStaff);
/**
 * @swagger
 * /api/v1/staff/update:
 *   post:
 *     tags:
 *     - staff
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Update staff details
 *     produces:
 *       - application/json
 *     parameters:
 *       - name: username
 *       - name: staffname
 *       - name: department
 *       - name: accesstype
 *     responses:
 *       200:
 *         description: login
 */
router.post(apiversion + 'staff/update', staff.updateStaffDetails);
/**
 * @swagger
 * /api/v1/staff/:
 *   get:
 *     tags:
 *     - staff
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Get All Staff
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: page
 *        in: query
 *        type:
 *      - name: npp
 *     responses:
 *       200:
 *         description:
 */
router.get(apiversion + 'staff/', staff.getAllStaff);

router.get(apiversion + 'staff/search', staff.searchStaff);
/**
 * @swagger
 * /api/v1/staff/{username}:
 *   get:
 *     tags:
 *     - staff
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Get Staff details
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: username
 *        in: path
 *        type: string
 *     responses:
 *       200:
 *         description:
 */
router.get(apiversion + 'staff/:username', staff.getStaffDetails);

// Property
/**
 * @swagger
 * /api/v1/property/new:
 *   post:
 *     tags:
 *     - property
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Create new property
 *     produces:
 *       - application/json
 *     parameters:
 *     - in: body
 *       name: body
 *       required: true
 *       schema:
 *        type: object
 *        properties:
 *          propertyname:
 *            type: string
 *          address1:
 *            type: string
 *          address2:
 *            type: string
 *          suburb:
 *            type: string
 *          state:
 *            type: string
 *          postcode:
 *            type: integer
 *          country:
 *            type: string
 *          propertytype:
 *            type: integer
 *          latitude:
 *            type: integer
 *          longitude:
 *            type: integer
 *     responses:
 *       200:
 *         description: Create new property
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/property"
 *
 */
router.post(apiversion + 'property/new', property.createNewProperty);
/**
 * @swagger
 * /api/v1/property/update:
 *   post:
 *     tags:
 *     - property
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Update property details
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: property
 *         description: Property to create
 *         schema:
 *           type: object
 *           $ref: "#/definitions/property"
 *     responses:
 *       200:
 *         description: Update property
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/property"
 *
 */
router.post(apiversion + 'property/update', property.updatePropertyDetails);
/**
 * @swagger
 * /api/v1/property/:
 *   get:
 *     tags:
 *     - property
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Get All Properties
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: page
 *        in: query
 *        type: integer
 *      - name: npp
 *        description: num of results per page
 *        in: query
 *        type: integer
 *     responses:
 *       200:
 *         description: Return all properties
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             page:
 *               type: integer
 *             properties:
 *               type: object
 *               $ref: "#/definitions/property"
 *
 */
router.get(apiversion + 'property/', property.getAllProperties);
/**
 * @swagger
 *
 * /api/v1/property/{propertyid}:
 *   get:
 *     tags:
 *     - property
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: propertyid
 *        type: integer
 *        in: path
 *     responses:
 *       200:
 *         description: Return a property detail
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/property"
 *
 */
router.get(apiversion + 'property/:propertyid', property.getPropertyDetails);
router.get(apiversion + 'property/canonical/:canonicalid', property.getPropertyByCanonical);

// Claim
/**
 * @swagger
 * /api/v1/claim/new:
 *   post:
 *     tags:
 *     - claim
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: New Claim details
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: claim
 *         description: Claim to create
 *         schema:
 *           type: object
 *           $ref: "#/definitions/newclaim"
 *     responses:
 *       200:
 *         description: Create new claim
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/claim"
 *
 */
router.post(apiversion + 'claim/new', claim.createNewClaim);
/**
 * @swagger
 *
 * /api/v1/claim/username/{username}:
 *   get:
 *     tags:
 *     - claim
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     produces:
 *       - application/json
 *     responses:
 *       200:
 *         description: Return a claim details
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             page:
 *               type: integer
 *             property:
 *               type: object
 *               $ref: "#/definitions/claim"
 *
 */
router.get(apiversion + 'claim/username/:username', claim.getClaimByUser);
/**
 * @swagger
 * /api/v1/claim/update:
 *   post:
 *     tags:
 *     - claim
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Update claim details
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: property
 *         description: Update claim to create
 *         schema:
 *           type: object
 *           $ref: "#/definitions/property"
 *     responses:
 *       200:
 *         description: Update claim
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/claim"
 *
 */
router.post(apiversion + 'claim/update', claim.updateClaimDetails);
/**
 * @swagger
 *
 * /api/v1/claim/:
 *   get:
 *     tags:
 *     - claim
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     produces:
 *       - application/json
 *     responses:
 *       200:
 *         description: Return a claim details
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             page:
 *               type: integer
 *             property:
 *               type: object
 *               $ref: "#/definitions/claim"
 *
 */
router.get(apiversion + 'claim/', claim.getAllClaims);
/**
 * @swagger
 *
 * /api/v1/claim/{claimid}:
 *   get:
 *     tags:
 *     - property
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: claimid
 *        type: integer
 *        in: path
 *     responses:
 *       200:
 *         description: Return a claim detail
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/claim"
 *
 */
router.get(apiversion + 'claim/:claimid', claim.getClaimDetails);

// Worklog
/**
 * @swagger
 * /api/v1/worklog/new:
 *   post:
 *     tags:
 *     - worklog
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Create worklog details
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: property
 *         description: Property to create
 *         schema:
 *           type: object
 *           $ref: "#/definitions/worklog"
 *     responses:
 *       200:
 *         description: Create worklog
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/worklog"
 *
 */
router.post(apiversion + 'worklog/new', worklog.createNewWorkItem);
/**
 * @swagger
 * /api/v1/worklog/upload/new:
 *   post:
 *     tags:
 *     - worklog
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Upload new attachment
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: attachment
 *         description: File to upload
 *     responses:
 *       200:
 *         description: Upload new attachment
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/attachment"
 *
 */
router.post(apiversion + 'worklog/upload/new', worklog.uploadAttachment);
/**
 * @swagger
 * /api/v1/worklog/upload/update:
 *   post:
 *     tags:
 *     - worklog
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Update worklog attachment
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: attachment
 *         description: Attachment to update
 *         schema:
 *           type: object
 *           $ref: "#/definitions/attachment"
 *     responses:
 *       200:
 *         description: Update worklog attachment
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/attachment"
 *
 */
router.post(apiversion + 'worklog/upload/update', worklog.updateAttachment);
/**
 * @swagger
 * /api/v1/worklog/update:
 *   post:
 *     tags:
 *     - property
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Update worklog details
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: worklog
 *         description: Worklog to update
 *         schema:
 *           type: object
 *           $ref: "#/definitions/worklog"
 *     responses:
 *       200:
 *         description: Update worklog
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/worklog"
 *
 */
router.post(apiversion + 'worklog/update', worklog.updateWorkLogItem);
/**
 * @swagger
 * /api/v1/worklog/upload/delete:
 *   post:
 *     tags:
 *     - worklog
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Delete attachment
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: attachment
 *         description: Attachment to delete
 *         schema:
 *           type: object
 *           $ref: "#/definitions/worklog"
 *     responses:
 *       200:
 *         description: Deleted attachment
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/attachment"
 *
 */
router.post(apiversion + 'worklog/upload/delete', worklog.deleteAttachment);
/**
 * @swagger
 *
 * /api/v1/worklog/workitem/{worklogid}:
 *   get:
 *     tags:
 *     - worklog
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: worklogid
 *        type: integer
 *        in: path
 *     responses:
 *       200:
 *         description: Return a workitem
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/worklog"
 *
 */
router.get(apiversion + 'worklog/workitem/:worklogid', worklog.getWorkItemLog);
/**
 * @swagger
 *
 * /api/v1/workitems/{worklogid}:
 *   get:
 *     tags:
 *     - worklog
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     produces:
 *       - application/json
 *     parameters:
 *      - name: worklogid
 *        type: integer
 *        in: path
 *     responses:
 *       200:
 *         description: Return all workitems for worklog
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/worklog"
 *
 */
router.get(apiversion + 'worklog/workitems/:worklogid', worklog.getAllWorkItemLog);

// Inspection
/**
 * @swagger
 * /api/v1/inspection/new:
 *   post:
 *     tags:
 *     - inspection
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Create new inspection
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: inspection
 *         description: Inspection to create
 *         schema:
 *           type: object
 *           $ref: "#/definitions/inspection"
 *     responses:
 *       200:
 *         description: Create inspection
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/inspection"
 *
 */
router.post(apiversion + 'inspection/new', inspection.createNewInspection);

/**
 * @swagger
 * /api/v1/inspection/email:
 *   post:
 *     tags:
 *     - inspection
 *     security:
 *     - apikey1: []
 *     - apikey2: []
 *     description: Send inspection email
 *     produces:
 *       - application/json
 *     parameters:
 *       - in: body
 *         name: inspection
 *         description: Send Inspection request
 *         schema:
 *           type: object
 *           $ref: "#/definitions/inspection"
 *     responses:
 *       200:
 *         description: Send inspection request
 *         schema:
 *           type: object
 *           properties:
 *             success:
 *               type: boolean
 *             property:
 *               type: object
 *               $ref: "#/definitions/inspection"
 *
 */
router.post(apiversion + 'notification/inspection', notification.sendInspectionEmail);
router.post(apiversion + 'notification/claimstatus', notification.sendClaimStatusEmail);
router.post(apiversion + 'notification/verifymail', notification.sendVerifyEmail);

// dashboard
router.get(apiversion + 'dashboard/user/:username', notification.getUserDashboard);
router.get(apiversion + 'dashboard/staff/:username', notification.getStaffDashboard);
router.get(apiversion + 'dashboard/calendar/:username', notification.getStaffCalendar);

// assign
router.post(apiversion + 'claim/assign/', claim.assignClaim);
router.get(apiversion + 'claim/assign/:claimid', claim.getAssignment);
router.get(apiversion + 'claim/assign/all/:username', claim.getAssignedByUser);
router.post(apiversion + 'claim/approve/', claim.approveClaim);

// attachment
router.get(apiversion + 'attachment/download/:itemid', worklog.downloadAttachment);

router.post(apiversion + 'claim/status', claim.updateClaimStatus);

router.post(apiversion + 'sms/notify', smsapi.sendSMS);
router.get(apiversion + 'address/search', addressapi.searchAddress);
router.get(apiversion + 'address/complete', addressapi.completeAddress);

// Ace Config
router.get(apiversion + 'config/:groupid', aceconfig.getGroupid);
router.get(apiversion + 'config/:groupid/:ordinal', aceconfig.getOrdinal);

router.get('/inspection-view/:token', inspection.getInspectionDetailsByToken);
router.post('/inspection-view/', inspection.updateInspectionStatus);

module.exports = router;
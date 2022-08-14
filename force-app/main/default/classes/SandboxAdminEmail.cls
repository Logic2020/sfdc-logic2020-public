//Created by Scott S Nelson
global class SandboxAdminEmail implements SandboxPostCopy{
    global void runApexClass(SandboxContext context) { 
        User[] adminsToUpdate = [select Email from User where profile.name = 'System Administrator' and Email like '%.invalid']; 
        if(adminsToUpdate.size() > 0)
        {
            for(User adminUser : adminsToUpdate)     
            { 
                adminUser.Email = adminUser.Email.remove('.invalid');
            }
             Update adminsToUpdate; 
        } 
    }
}
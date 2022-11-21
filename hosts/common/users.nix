{ config, pkgs, ...}:

{
  users = {
    mutableUsers = false;

    users = {
      gui = {
        isNormalUser = true;
        hashedPassword = "$6$0pkRqHNzwEluhMz/$WVb0iiLiYz6avBxS0RgwrpTVsHTfsPEVPM17JjUvTQDFf3o3Q3FUrsGfLhLOMEEItR.Ph2ky56rPZVjpgBxWX0";

        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdOHcubB0bj8deVZ6P2KmuaqD9Le1mLykg1os69q5LLvmbBDtftVIcm7i/EROWU7/GyySW7rzTyGthhviHnKWbHJKyfgKcoOHc7Bxze4g2/72pxwi/bnG9xIf0GWeBx7Of+0JYGHEvEF1VcgIZKti22ENI+h3Oi/zTpY4Z+CSexU4Vz/T7uxZyd7TgLT3uxWdIAU26UfakEMUvewG1FKIPsYEHjNVTvHNx9kNq6KigNAUy1qClGKQybSSbr30KN/q82/kaYp2QjhUgGaPMs9mPriszVvxsCb5t6LXtPjTYTCcUYvLsZIVOhXqmKLD2Eku0kmU+26tVISjhmwVF2CwjB3EdLVlXEbvrBAxRQWa63ZMu85OZMCKQAgA43LYKX4pWgVcGVZQBqQyCR8sw5jrNn48ngJO1AKFQpHQjcEgKpbYdegm5vN/xq8M1a2rnklECb378pemXMi8sevjVwGkU0E+D8NO62zO3L98n8DDn3cF14aWObl3zqLF+bM3UPhM= gui@host" ];

      };

      githubactions = {
        isSystemUser = true;
        openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/g/kctFPTbZfehzEFszaPLF3/7mBTurgM4PkbotZo3rXQWUJ1MUKlCFfj4Z0d14DZaTsJWlLC26p1+sw8lsyU1XwF9EokSEXVMqfAwrGjOfvSdUPqzG/rzo/tSdXB0t/dbUBaXOfXbiy0TqareAZWulglbMDCnfqhiYil9p3PMyB2iyAO96mXhv9ey5Hzk6gDW2udhYFrcpf5I8/u/Why4fj5lBfgQENHif2Cuaa4qBfULzjzRVwB2EwanvVrGdRhEUwB+at4zymB2UgvcGACO3RN0Dwm0HAGqsgddOE9bVVzRUwHbnRj68yxnhRVW6VMCmZgoQUQZ//NVLbc3lqPEeS5KJ8Om4YKzPE5znDZkAuTscFVpY3Z/JjN3A9KlYaQwfeaV6Pu/9mclxZa864KqlzIXkaRW1X/zLOUfBtDp4lXEOHAtvQsBSim66cevla5hX0oQIHrI3VQCa7ZtVLEywsncVSIYAsXB2J+OgzKSexMMEV/AD+bYuYJHGbYiik= git@github" ];
      };

    };
  };

}

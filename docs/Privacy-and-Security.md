## Encryption

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/5f67d5e3-372c-4951-88a1-e5210c01c76a)

Encryption is performed through the
[AES-256](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)
standard. It possesses incredible entropy, meaning brute force attacks
are practically impossible.

The combination of your User ID and password generates an unique
**Authentication Token** on login. It lets the server know it\'s you,
allowing it to know about your subscription, your settings, and which
stories you own that are hosted on the server.

Logging in also creates an **Encryption Key** which is used to decrypt a
Keystore.

The Keystore contains *individual* keys to *each* of your stories. The
Keystore is *also* encrypted. Without the encryption key, the keystore
cannot be accessed, and thus, your stories cannot be accessed. Even if
someone were to obtain data from NAI\'s servers, they would not be able
to recover any human-legible data from it.

All decryption is done **solely on your device**. However, generation
requests are **unencrypted**. This is unavoidable: the GPU that runs the
AI cannot process encrypted data. The GPU and *Novel AI* do not perform
any logging of this data.

***

## Local Storage

Stories are locally stored using your browser's [Indexed
Database](https://en.wikipedia.org/wiki/Indexed_Database_API) in JSON
format. The entirety of War and Peace is 3 MB of text, so you really
don't have to worry about bloat.

Remember that your browser cannot record things permanently in
**Private/Incognito** mode, so **any stories made in such a session must
be exported, or they will be permanently lost**!

If you use cleaning software such as *CCleaner*, you might erase these
databases. As a result, make sure you back up anything you really want
to keep.

Storage is per device and per **browser**, so changing browsers will not
let you access stories made on the previous one. This also applies if
you use your phone instead of your computer, so you should use
serverside hosting if you want to have access to stories anywhere.

Keep in mind that *most browsers purge unused database entries after
some time.* Make sure you **back up your stories regularly!**

***

## Remote Storage

Remote storage stores your stories in encrypted JSON on NovelAI's
servers. They **cannot read it without your auth token**, which they do
not store. All it knows about saved JSON files is their owner. There is
no limit to how much storage you can request, as text compresses very
easily and takes little space.

***
# Account Management

All info here is a **placeholder**. It will be completed when possible.

## Account Termination

Visit your Account Settings if you wish to request to **Delete your
Account**. Once the procedure is completed, *NovelAI* purge all data
that corresponds to your account permanently. You will **not be able to
recover any stories you have not backed up**.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/ffd3efc5-e920-406e-b7be-4b24a06d11d4)


After tapping Request, you will need to enter the email address
registered to your account to continue. This will send you a
confirmation link you may use to delete your account.

Once you have the confirmation link, you have one more chance to abandon
the account deletion process. If you are still completely sure you want
to delete your account permanently, you may do so here.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/8f897152-c082-40fd-98f4-cdcf8a25b0e1)

***

## Changing Your Password

You can change your password. This will re-encrypt all of your content,
but you will not lose access to any of your stories.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/87f28f19-b4a8-4b50-a900-9713c52536e4)

If you fail to log in, you can click **Reset password** and follow the
steps. Keep in mind that you will lose access to all serverside stories
**permanently** if you change your password due to how the encryption
works.

If the process fails you can try contacting the NovelAI support at
**support@novelai.net**.

***

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/d033ad8a-909b-4f03-a6fc-e4877c4a02b6)

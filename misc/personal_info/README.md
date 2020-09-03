it is very important that when you add personal changes to the
personal_info.json file, that you update your git repository to stop tracking
the file, to ensure that your information is not accidentally pushed into a
public repo. this can be done with the following command:

```
git update-index --assume-unchanged <path to personal_info.json>
```

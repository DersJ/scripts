import requests


def main():
    body = {
        "orgs": [
            {
                "account_type": "business",
                "state": "live",
                "advanced_profile_state": "pending_submission",
            },  # noqa
            {
                "account_type": "ira",
                "advanced_profile_state": "approved",
                "state": "live",
            },  # noqa
        ],
    }

    url = "https://bm-anders-fortis.dev.uncd.io:3036/users/flexible"
    payload = body
    headers = {"Content-Type": "application/json"}

    response = requests.post(url, json=payload, headers=headers)

    if response.status_code != 200:
        print(f"Error: {response.status_code}")
        return

    data = response.json()
    print(data)


if __name__ == "__main__":
    main()

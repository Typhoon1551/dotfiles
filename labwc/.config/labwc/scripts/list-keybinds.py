#!/usr/bin/env python3
import json
import os
import re
import xml.etree.ElementTree as ET

IPC_PREFIX = re.compile(r"^qs\s+-p\s+\S+\s+ipc\s+call\s+")

rc_path = os.path.expanduser("~/.config/labwc/rc.xml")
tree = ET.parse(rc_path)
root = tree.getroot()

entries = []
for keybind in root.iter("keybind"):
    key = keybind.get("key")
    if not key:
        continue

    descriptions = []
    for action in keybind.findall("action"):
        command = action.get("command")
        if command:
            descriptions.append(IPC_PREFIX.sub("", command))
            continue

        name = action.get("name", "?")
        extras = [f"{k}={v}" for k, v in action.attrib.items() if k != "name"]
        descriptions.append(name + (" " + " ".join(extras) if extras else ""))

    entries.append({"key": key, "action": "; ".join(descriptions)})

print(json.dumps(entries))

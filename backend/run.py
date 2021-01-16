from backend_application.app import create_app
from backend_application.settings import ConfigType

app = create_app(ConfigType.DEV)
